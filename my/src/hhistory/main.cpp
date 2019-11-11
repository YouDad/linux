#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <time.h>
#include <vector>
#include <string>

std::vector<std::pair<int, std::string>>v;

struct YMDHMS {
	int Y, M, D, h, m, s;
};

void fast_date(struct YMDHMS *date, int ts)
{
	ts += 8 * 3600;
	date->h = ts % 86400 / 3600;
	date->m = ts % 3600 / 60;
	date->s = ts % 60;
	date->D = ts / 86400 + 365;
	int Y4 = date->D / (365 * 4 + 1);
	date->D -= Y4 * (365 * 4 + 1);
	date->Y = date->D / 365;
	date->Y = date->Y == 4 ? 3 : date->Y;
	date->D -= date->Y * 365;

	if (date->Y == 3 && date->D == 59) {
		date->M = 2;
		date->D = 28;
	} else if (date->Y == 3 && date->D > 59) {
		date->D--;
	}

	int months[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	int i;

	for (i = 0; date->D >= months[i]; i++) {
		date->D -= months[i];
	}

	date->M = i + 1;
	date->D++;
	date->Y += Y4 * 4 + 1969;
}

int main(int argc, char **argv)
{
	FILE *fp = NULL;

	if (argc != 2) {
		fprintf(stderr, "Usage: hhistory path/to/zsh_history\n");
		return -1;
	}

	fp = fopen(argv[1], "r");

	if (fp == NULL) {
		perror("fopen");
		return -1;
	}

	char s[256], *p = s, last_char = 0;
	int last_timestamp = 0, timestamp, n;

	while (true) {
		int ret = fread(p, 1, 1, fp);

		if (feof(fp)) {
			break;
		}

		if (*p == '\n') {
			*p = '\0';

			if (last_char != '\\') {
				if (sscanf(s, ": %d:0;%n", &timestamp, &n) == 1) {
					// if (timestamp >= last_timestamp) {
					if (timestamp >= 0) {
						v.push_back(std::make_pair(timestamp, s + n));
						last_timestamp = timestamp;
					}
				}

				p = s;
			} else {
				last_char = *p;
			}
		} else if (p - s < (sizeof s) - 1) {
			last_char = *p;
			p++;
		} else {
			last_char = *p;
		}
	}

	int now = time(0);
	struct YMDHMS now_date;
	fast_date(&now_date, now);
	struct YMDHMS most_old_date;
	fast_date(&most_old_date, v[0].first);
	int size = 0;

	for (int i = 1; i <= v.size(); i *= 10) {
		size++;
	}

	for (int i = v.size() - 1; i >= 0; i--) {
		struct YMDHMS timestamp_date;
		char timestr[32];
		const char *week;
		fast_date(&timestamp_date, v[i].first);

		switch (v[i].first / 86400 % 7) {
		case 0:
			week = "四";
			break;

		case 1:
			week = "五";
			break;

		case 2:
			week = "六";
			break;

		case 3:
			week = "日";
			break;

		case 4:
			week = "一";
			break;

		case 5:
			week = "二";
			break;

		case 6:
			week = "三";
			break;
		}

		if (most_old_date.Y != now_date.Y) {
			if (now_date.Y != timestamp_date.Y) {
				snprintf(timestr, sizeof timestr, "%04d-%02d-%02d %02d:%02d:%02d",
				         timestamp_date.Y, timestamp_date.M, timestamp_date.D,
				         timestamp_date.h, timestamp_date.m, timestamp_date.s);
			} else if (now_date.M != timestamp_date.M) {
				snprintf(timestr, sizeof timestr, "     %02d-%02d %02d:%02d:%02d",
				         timestamp_date.M, timestamp_date.D,
				         timestamp_date.h, timestamp_date.m, timestamp_date.s);
			} else if (now_date.D != timestamp_date.D) {
				snprintf(timestr, sizeof timestr, "        %02d %02d:%02d:%02d",
				         timestamp_date.D,
				         timestamp_date.h, timestamp_date.m, timestamp_date.s);
			} else {
				snprintf(timestr, sizeof timestr, "           %02d:%02d:%02d",
				         timestamp_date.h, timestamp_date.m, timestamp_date.s);
			}
		} else {
			if (now_date.M != timestamp_date.M) {
				snprintf(timestr, sizeof timestr, "%02d-%02d %02d:%02d:%02d",
				         timestamp_date.M, timestamp_date.D,
				         timestamp_date.h, timestamp_date.m, timestamp_date.s);
			} else if (now_date.D != timestamp_date.D) {
				snprintf(timestr, sizeof timestr, "   %02d %02d:%02d:%02d",
				         timestamp_date.D,
				         timestamp_date.h, timestamp_date.m, timestamp_date.s);
			} else {
				snprintf(timestr, sizeof timestr, "      %02d:%02d:%02d",
				         timestamp_date.h, timestamp_date.m, timestamp_date.s);
			}
		}

		char fmt[64];
		snprintf(fmt, sizeof fmt, "%%%dd %%s %%s %%s\n", size);
		printf(fmt, i + 1, week, timestr, v[i].second.c_str());
	}

	fclose(fp);
	return 0;
}
