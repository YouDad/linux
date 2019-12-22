/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static const int smartgaps          = 1;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
static const char *fonts[]          = { "Source Code Pro:size=12" };
static const char dmenufont[]       = "Source Code Pro:size=12";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#ffffff";
static const char col_cyan[]        = "#37474f";
static const char col_border[]      = "#42a5f5";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_border },
};

/* tagging */
static const char *tags[] = { "临", "一", "二", "三", "四", "五", "六", "七", "八", "九" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class                instance    title       tags mask     isfloating   monitor */
	{ "Clementine",         NULL,       NULL,       1 << 6,       0,           -1 },
	{ "Gedit",              NULL,       NULL,       0,            1,           -1 },
	{ "Org.gnome.gedit",    NULL,       NULL,       0,            1,           -1 },
	{ "Thunar",             NULL,       NULL,       0,            1,           -1 },
	{ "finger",             NULL,       NULL,       0,            1,           -1 },
	{ "Gnome-terminal",     NULL,       NULL,       0,            1,           -1 },
	{ "Zenity",             NULL,       NULL,       0,            1,           -1 },
	{ "Org.gnome.Nautilus", NULL,       NULL,       0,            1,           -1 },
	{ "Blueman-manager",    NULL,       NULL,       0,            1,           -1 },
	{ "Thunderbird",        NULL,       NULL,       1 << 0,       0,           -1 },
	{ "Variety",            NULL,       NULL,       1 << 0,       0,           -1 }
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define ALTKEY   Mod1Mask
#define WINKEY   Mod4Mask
#define SHIFTKEY ShiftMask
#define CTRLKEY  ControlMask

#define TAGKEYS(KEY,TAG) \
	{ WINKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ WINKEY|CTRLKEY,               KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ WINKEY|SHIFTKEY,              KEY,      tag,            {.ui = 1 << TAG} }, \
	{ WINKEY|CTRLKEY|SHIFTKEY,      KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "alacritty", NULL };
static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = { "alacritty", "-t", scratchpadname, "-d", "120", "34", NULL };
static const char *browsercmd[]  = { "firefox", NULL };
static const char *rofiruncmd[]  = { "rofi", "-show", "run", NULL };
static const char *rofidruncmd[]  = { "rofi", "-show", "drun", NULL };
static const char *winkcmd[]  = { "blueman-manager", NULL };
static const char *winecmd[]  = { "nautilus", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	// { WINKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ WINKEY,                       XK_d,      spawn,          {.v = rofiruncmd } },
	{ WINKEY|SHIFTKEY,              XK_d,      spawn,          {.v = rofidruncmd } },
	{ WINKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ WINKEY,                       XK_c,      spawn,          {.v = browsercmd } },
	{ WINKEY|SHIFTKEY,              XK_Return, togglescratch,  {.v = scratchpadcmd } },
	{ WINKEY,                       XK_b,      togglebar,      {0} },
	{ WINKEY|SHIFTKEY,              XK_j,      rotatestack,    {.i = +1 } },
	{ WINKEY|SHIFTKEY,              XK_k,      rotatestack,    {.i = -1 } },
	{ WINKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ WINKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ WINKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ WINKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ WINKEY,                       XK_Tab,    view,           {0} },
	{ WINKEY,                       XK_q,      killclient,     {0} },
	{ WINKEY,                       XK_f,      togglefullscr,  {0} },
	{ WINKEY|SHIFTKEY,              XK_space,  togglefloating, {0} },
	{ WINKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ WINKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ WINKEY|SHIFTKEY,              XK_comma,  tagmon,         {.i = -1 } },
	{ WINKEY|SHIFTKEY,              XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_0,                      0)
	TAGKEYS(                        XK_1,                      1)
	TAGKEYS(                        XK_2,                      2)
	TAGKEYS(                        XK_3,                      3)
	TAGKEYS(                        XK_4,                      4)
	TAGKEYS(                        XK_5,                      5)
	TAGKEYS(                        XK_6,                      6)
	TAGKEYS(                        XK_7,                      7)
	TAGKEYS(                        XK_8,                      8)
	TAGKEYS(                        XK_9,                      9)
	{ WINKEY|SHIFTKEY,              XK_e,      quit,           {0} },
	{ WINKEY|CTRLKEY,               XK_e,      spawn,          { .v = winecmd } },
	{ WINKEY|CTRLKEY,               XK_k,      spawn,          { .v = winkcmd } },

	// { WINKEY,                       XK_0,      view,           {.ui = ~0 } },
	// { WINKEY|SHIFTKEY,              XK_0,      tag,            {.ui = ~0 } },
	// { WINKEY,                       XK_Return, zoom,           {0} },
	// { WINKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	// { WINKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	// { WINKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	// { WINKEY,                       XK_space,  setlayout,      {0} },
	// { WINKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	// { WINKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	// { WINKEY|ALTKEY,                XK_h,      incrgaps,       {.i = +1 } },
	// { WINKEY|ALTKEY,                XK_l,      incrgaps,       {.i = -1 } },
	// { WINKEY|ALTKEY|SHIFTKEY,       XK_h,      incrogaps,      {.i = +1 } },
	// { WINKEY|ALTKEY|SHIFTKEY,       XK_l,      incrogaps,      {.i = -1 } },
	// { WINKEY|ALTKEY|CTRLKEY,        XK_h,      incrigaps,      {.i = +1 } },
	// { WINKEY|ALTKEY|CTRLKEY,        XK_l,      incrigaps,      {.i = -1 } },
	// { WINKEY|ALTKEY,                XK_0,      togglegaps,     {0} },
	// { WINKEY|ALTKEY|SHIFTKEY,       XK_0,      defaultgaps,    {0} },
	// { WINKEY,                       XK_y,      incrihgaps,     {.i = +1 } },
	// { WINKEY,                       XK_o,      incrihgaps,     {.i = -1 } },
	// { WINKEY|CTRLKEY,               XK_y,      incrivgaps,     {.i = +1 } },
	// { WINKEY|CTRLKEY,               XK_o,      incrivgaps,     {.i = -1 } },
	// { WINKEY|ALTKEY,                XK_y,      incrohgaps,     {.i = +1 } },
	// { WINKEY|ALTKEY,                XK_o,      incrohgaps,     {.i = -1 } },
	// { WINKEY|SHIFTKEY,              XK_y,      incrovgaps,     {.i = +1 } },
	// { WINKEY|SHIFTKEY,              XK_o,      incrovgaps,     {.i = -1 } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         WINKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         WINKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         WINKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            WINKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            WINKEY,         Button3,        toggletag,      {0} },
};

