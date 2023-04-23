#include <YSI_Coding\y_hooks>
// #include <YSI_Coding\y_malloc>

#define PhoneHomeIcons 9

//phone contect variables
#define p_Max_Contect 35
#define p_Max_Contect_Perpage 5
#define SHOW_CONTECTS 1
//contect SYstem
#define    PAGE_LIMIT_OFFSET (5)
//SETTINGS VARS
new TOTAL_WALLPAPERS = 7;
//icons
static PlayerText:p_icon[MAX_PLAYERS][11] =  {{PlayerText:INVALID_TEXT_DRAW, ...}, ...};
static PlayerText:p_calculator[MAX_PLAYERS][21] =  {{PlayerText:INVALID_TEXT_DRAW, ...}, ...};

static PlayerText:applelogo[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:bootdots[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};

//global textdraws
static Text:p_nav_time = Text:INVALID_TEXT_DRAW;

//playertextdraw commons
static PlayerText:p_container[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:p_nav_battery[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:p_nav_network[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:p_background[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:p_whitebackground[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:p_body[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};

//settings

static PlayerText:pSetting_AmContainer[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pSetting_Amtext[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pSetting_settingText[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pSetting_changWall_container[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pSetting_changeWallText[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pSetting_AboutContainer[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pSetting_AboutText[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pSetting_Amswitch[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};

//wallpaper change
static PlayerText:pWallpaper_bgscreen[MAX_PLAYERS] =  {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pWallpaper_page[MAX_PLAYERS]  =  {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pWallpaper_container[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pWallpaper_apply[MAX_PLAYERS] =  {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pWallpaper_prev[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pWallpaper_next[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};


//Contects
static PlayerText:pContect_bcreate[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pContect_bCover[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pContect_bpage[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pContect_bprev[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pContect_bNext[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};

static PlayerText:pContect_Cover[MAX_PLAYERS][p_Max_Contect_Perpage] = {{PlayerText:INVALID_TEXT_DRAW, ...}, ...};
static PlayerText:pContect_Icon[MAX_PLAYERS][p_Max_Contect_Perpage] = {{PlayerText:INVALID_TEXT_DRAW, ...}, ...};
static PlayerText:pContect_NameNum[MAX_PLAYERS][p_Max_Contect_Perpage] = {{PlayerText:INVALID_TEXT_DRAW, ...}, ...};
//the dialing pad

static PlayerText:pDialPad_deletebtn[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pDialPad_addcon[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pDialPad_numtext[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pDialPad_call[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pDialPad_shownumtext[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};

static PlayerText:pDialPad[MAX_PLAYERS][10] =  {{PlayerText:INVALID_TEXT_DRAW, ...}, ...};

//Music baby
static PlayerText:pMusic_page[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pMusic_AddSong[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pMusic_bCover[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pMusic_bControl[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pMusic_bControl_img[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pMusic_bprev[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pMusic_bprev_img[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pMusic_bnext[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
static PlayerText:pMusic_bnext_img[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};

static PlayerText:pMusic_cover[MAX_PLAYERS][PAGE_LIMIT_OFFSET] = {{PlayerText:INVALID_TEXT_DRAW, ...}, ...};
static PlayerText:pMusic_SongName[MAX_PLAYERS][PAGE_LIMIT_OFFSET] = {{PlayerText:INVALID_TEXT_DRAW, ...}, ...};
static PlayerText:pMusic_chit[MAX_PLAYERS][PAGE_LIMIT_OFFSET] = {{PlayerText:INVALID_TEXT_DRAW, ...}, ...};
static PlayerText:pMusic_play[MAX_PLAYERS][PAGE_LIMIT_OFFSET] = {{PlayerText:INVALID_TEXT_DRAW, ...}, ...};

enum Musicenum
{
    songName[18],
    songUrl[246],
    bool:play
}
new Musicinfo[MAX_PLAYERS][Musicenum];

//camera stuffs
#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
new Float:Degree[MAX_PLAYERS];

const Float:Radius = 1.4; //do not edit this
const Float:Speed  = 1.25; //do not edit this
const Float:Height = 0.8; // do not edit this


new Float:lX[MAX_PLAYERS];
new Float:lY[MAX_PLAYERS];
new Float:lZ[MAX_PLAYERS];
new hiden[MAX_PLAYERS];

static enum SettingEnum
{
    apmode,
    currentWallpaper[25]
};
new wallpaperscreen[][25] =
{
    "mdl-1005:background",
    "mdl-1005:background1",
    "mdl-1005:background2",
    "mdl-1005:background3",
    "mdl-1005:background4",
    "mdl-1005:background5",
    "mdl-1005:background6",
    "mdl-1005:background7"
};
new Settings[MAX_PLAYERS][SettingEnum];


forward getWallpaper(playerid);
public getWallpaper(playerid)
{
    cache_get_field_content(0, "bg", Settings[playerid][currentWallpaper], SQLConnectionId, 25);
    return 1;
}

enum Status
{
    PHONE_SHOWN,
    PHONE_HOME_SHOWN,
    PHONE_CALCULATOR_SHOWN,
    PHONE_CONTECTS_SHOWN,
    PHONE_CAMERA__SHWON,
    PHONE_DIALPAD_SHOWN,
    PHONE_MUSIC_SHOWN,
    PHONE_SETTINGS_SHOWN,
    PHONE_CHANGEWALLPAPER_SHWON
};
new bool:phoneStatus[MAX_PLAYERS][Status];
new plength;
enum calculatorEnum
{
    string[10],
    calkey[2],
    operandc,
    bool:opera,
    Float:value1,
    Float:value2,
    Float:result
};
new calcLogic[MAX_PLAYERS][calculatorEnum];

static enum ContectEnum
{
    contectName[15],
    contectNumber
};

new contects[MAX_PLAYERS][ContectEnum];

new DialString[MAX_PLAYERS][25];
new DialKey[MAX_PLAYERS][2];

new queryBuffer[256];



new Page[MAX_PLAYERS];
new Page_Total[MAX_PLAYERS];

Load_Phone(playerid)
{
    Page[playerid] = 0;
    Page_Total[playerid] = 0;
    return 1;
}
Max_Page(total, limit)
{
    return ((total - 1) / limit) + 1;
}

forward AddContect(playerid, ContectName[], ContectNumber);
public AddContect(playerid, ContectName[], ContectNumber)
{
    mysql_format(SQLConnectionId, queryBuffer, sizeof(queryBuffer), "INSERT INTO contects (Cname, Cnumber) VALUES('%s', %d)", ContectName, ContectNumber);
    mysql_tquery(SQLConnectionId, queryBuffer);
    Page_Query(playerid);
    SendClientMessage(playerid, -1, "Number Successfully Added");
    return 1;
}

forward Page_Query_Loaded(playerid);
public Page_Query_Loaded(playerid)
{
    new rows = cache_num_rows();
    if (rows)
    {
        new name[MAX_PLAYER_NAME];
        new number;

        for (new i = 0; i < PAGE_LIMIT_OFFSET; i++)
        {
            PlayerTextDrawHide(playerid, pContect_Cover[playerid][i]);
            PlayerTextDrawHide(playerid, pContect_Icon[playerid][i]);
            PlayerTextDrawHide(playerid, pContect_NameNum[playerid][i]);
        }
        for (new i = 0; i < rows; i++)
        {
            cache_get_field_content(i, "Cname", name, SQLConnectionId, MAX_PLAYER_NAME);
            Page_Total[playerid] = cache_get_field_content_int(i, "total");
            number = cache_get_field_content_int(i, "Cnumber");
            // other data...
            PlayerTextDrawShow(playerid, pContect_Cover[playerid][i]);
            PlayerTextDrawShow(playerid, pContect_Icon[playerid][i]);
            PlayerTextDrawShow(playerid, pContect_NameNum[playerid][i]);
            PlayerTextDrawSetString(playerid, pContect_NameNum[playerid][i], "%s~n~%d", name, number);
        }
    }
    PlayerTextDrawSetString(playerid, pContect_bpage[playerid], "%d/%d", Page[playerid] + 1, Max_Page(Page_Total[playerid], PAGE_LIMIT_OFFSET));
    return 1;
}
forward Page_Query(playerid);
public Page_Query(playerid)
{
    mysql_format(SQLConnectionId, queryBuffer, sizeof(queryBuffer), "SELECT *, (SELECT COUNT(*) FROM contects) AS total FROM contects LIMIT %d, %d;", (Page[playerid] * PAGE_LIMIT_OFFSET), PAGE_LIMIT_OFFSET);
    mysql_tquery(SQLConnectionId, queryBuffer, "Page_Query_Loaded", "i", playerid);
    return 1;
}

stock PhoneContectsBase(playerid, bool:Hide)
{
    if (!Hide)
    {
        phoneStatus[playerid][PHONE_CONTECTS_SHOWN] = true;
        PhoneHomeScreen(playerid, true);
        PhoneBody(playerid, false, false, -421070081);
        PhoneNavbar(playerid, false);


        pContect_bcreate[playerid] = CreatePlayerTextDraw(playerid, 585.000, 206.000, "Add Contact");
        PlayerTextDrawLetterSize(playerid, pContect_bcreate[playerid], 0.194, 1.098);
        PlayerTextDrawTextSize(playerid, pContect_bcreate[playerid], 10.000, 55.000);
        PlayerTextDrawAlignment(playerid, pContect_bcreate[playerid], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, pContect_bcreate[playerid], 255);
        PlayerTextDrawSetShadow(playerid, pContect_bcreate[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pContect_bcreate[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pContect_bcreate[playerid], 150);
        PlayerTextDrawFont(playerid, pContect_bcreate[playerid], TEXT_DRAW_FONT_2);
        PlayerTextDrawSetProportional(playerid, pContect_bcreate[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pContect_bcreate[playerid], true);

        pContect_bCover[playerid] = CreatePlayerTextDraw(playerid, 499.000, 376.000, "mdl-1005:container");
        PlayerTextDrawTextSize(playerid, pContect_bCover[playerid], 121.000, 45.000);
        PlayerTextDrawAlignment(playerid, pContect_bCover[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pContect_bCover[playerid], 1887473919);
        PlayerTextDrawSetShadow(playerid, pContect_bCover[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pContect_bCover[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pContect_bCover[playerid], 255);
        PlayerTextDrawFont(playerid, pContect_bCover[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pContect_bCover[playerid], true);

        pContect_bpage[playerid] = CreatePlayerTextDraw(playerid, 560.000, 386.000, "0/0");
        PlayerTextDrawLetterSize(playerid, pContect_bpage[playerid], 0.209, 1.297);
        PlayerTextDrawAlignment(playerid, pContect_bpage[playerid], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, pContect_bpage[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pContect_bpage[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pContect_bpage[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pContect_bpage[playerid], 150);
        PlayerTextDrawFont(playerid, pContect_bpage[playerid], TEXT_DRAW_FONT_2);
        PlayerTextDrawSetProportional(playerid, pContect_bpage[playerid], true);

        pContect_bprev[playerid] =  CreatePlayerTextDraw(playerid, 516.000, 384.000, "mdl-1006:left");
        PlayerTextDrawTextSize(playerid, pContect_bprev[playerid], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, pContect_bprev[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pContect_bprev[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pContect_bprev[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pContect_bprev[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pContect_bprev[playerid], 255);
        PlayerTextDrawFont(playerid, pContect_bprev[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pContect_bprev[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pContect_bprev[playerid], true);

        pContect_bNext[playerid] = CreatePlayerTextDraw(playerid, 581.000, 384.000, "mdl-1006:right");
        PlayerTextDrawTextSize(playerid, pContect_bNext[playerid], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, pContect_bNext[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pContect_bNext[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pContect_bNext[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pContect_bNext[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pContect_bNext[playerid], 255);
        PlayerTextDrawFont(playerid, pContect_bNext[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pContect_bNext[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pContect_bNext[playerid], true);

        PlayerTextDrawShow(playerid, pContect_bcreate[playerid]);
        PlayerTextDrawShow(playerid, pContect_bCover[playerid]);
        PlayerTextDrawShow(playerid, pContect_bpage[playerid]);
        PlayerTextDrawShow(playerid, pContect_bprev[playerid]);
        PlayerTextDrawShow(playerid, pContect_bcreate[playerid]);
        PlayerTextDrawShow(playerid, pContect_bNext[playerid]);

        backbtn(playerid, false);

        new Float:y = 224.0;

        for (new i = 0; i < p_Max_Contect_Perpage; i++)
        {
            pContect_Cover[playerid][i] = CreatePlayerTextDraw(playerid, 502.000, y, "mdl-1005:container");
            PlayerTextDrawTextSize(playerid, pContect_Cover[playerid][i], 115.000, 27.000);
            PlayerTextDrawAlignment(playerid, pContect_Cover[playerid][i], TEXT_DRAW_ALIGN_LEFT);
            PlayerTextDrawColour(playerid, pContect_Cover[playerid][i], -1061109505);
            PlayerTextDrawSetShadow(playerid, pContect_Cover[playerid][i], 0);
            PlayerTextDrawSetOutline(playerid, pContect_Cover[playerid][i], 0);
            PlayerTextDrawBackgroundColour(playerid, pContect_Cover[playerid][i], 255);
            PlayerTextDrawFont(playerid, pContect_Cover[playerid][i], TEXT_DRAW_FONT_SPRITE_DRAW);
            PlayerTextDrawSetProportional(playerid, pContect_Cover[playerid][i], true);
            PlayerTextDrawSetSelectable(playerid, pContect_Cover[playerid][i], true);

            pContect_Icon[playerid][i] = CreatePlayerTextDraw(playerid, 507.000, y + 6, "mdl-1006:person");
            PlayerTextDrawTextSize(playerid, pContect_Icon[playerid][i], 14.000, 14.000);
            PlayerTextDrawAlignment(playerid, pContect_Icon[playerid][i], TEXT_DRAW_ALIGN_LEFT);
            PlayerTextDrawColour(playerid, pContect_Icon[playerid][i], -1);
            PlayerTextDrawSetShadow(playerid, pContect_Icon[playerid][i], 0);
            PlayerTextDrawSetOutline(playerid, pContect_Icon[playerid][i], 0);
            PlayerTextDrawBackgroundColour(playerid, pContect_Icon[playerid][i], 255);
            PlayerTextDrawFont(playerid, pContect_Icon[playerid][i], TEXT_DRAW_FONT_SPRITE_DRAW);
            PlayerTextDrawSetProportional(playerid, pContect_Icon[playerid][i], true);

            pContect_NameNum[playerid][i] = CreatePlayerTextDraw(playerid, 522.000, y + 4, "Example Name ~n~Examplenum12345");
            PlayerTextDrawLetterSize(playerid, pContect_NameNum[playerid][i], 0.250, 1.000);
            PlayerTextDrawTextSize(playerid, pContect_NameNum[playerid][i], 608.000, 0.000);
            PlayerTextDrawAlignment(playerid, pContect_NameNum[playerid][i], TEXT_DRAW_ALIGN_LEFT);
            PlayerTextDrawColour(playerid, pContect_NameNum[ playerid][i], 255);
            PlayerTextDrawSetShadow(playerid, pContect_NameNum[playerid][i], 0);
            PlayerTextDrawSetOutline(playerid, pContect_NameNum[playerid][i], 0);
            PlayerTextDrawBackgroundColour(playerid, pContect_NameNum[playerid][i], 150);
            PlayerTextDrawFont(playerid, pContect_NameNum[playerid][i], TEXT_DRAW_FONT_1);
            PlayerTextDrawSetProportional(playerid, pContect_NameNum[playerid][i], true);

            y += 30;
        }
        Page_Query(playerid);
    }
    else
    {

        for (new i = 0; i < p_Max_Contect_Perpage; i++)
        {
            PlayerTextDrawDestroy(playerid, pContect_Cover[playerid][i]);
            PlayerTextDrawDestroy(playerid, pContect_Icon[playerid][i]);
            PlayerTextDrawDestroy(playerid, pContect_NameNum[playerid][i]);
        }
        PlayerTextDrawDestroy(playerid, pContect_bCover[playerid]);
        PlayerTextDrawDestroy(playerid, pContect_bprev[playerid]);
        PlayerTextDrawDestroy(playerid, pContect_bcreate[playerid]);
        PlayerTextDrawDestroy(playerid, pContect_bNext[playerid]);

        phoneStatus[playerid][PHONE_CONTECTS_SHOWN] = false;
        PhoneHomeScreen(playerid, true);
        PhoneHomeScreen(playerid, false);

    }
}

ClearChatbox(playerid)
{
    for (new i = 0; i < 50; i++)
    {
        SendClientMessage(playerid, Colour_WHITE, "");
    }
    return 1;
}

checkaudiostream(i)
{
    if (Musicinfo[i][play])
        PlayerTextDrawSetString(i, pMusic_bControl_img[i], "mdl-1006:button-stop");
    else
        PlayerTextDrawSetString(i, pMusic_bControl_img[i], "mdl-1006:button-play");

}

forward Music_Query_Loaded(playerid);
public Music_Query_Loaded(playerid)
{
    new name[18];
    new rows = cache_num_rows();
    if (rows)
    {
        for (new i = 0; i < PAGE_LIMIT_OFFSET; i++)
        {

            PlayerTextDrawHide(playerid, pMusic_cover[playerid][i]);
            PlayerTextDrawHide(playerid, pMusic_chit[playerid][i]);
            PlayerTextDrawHide(playerid, pMusic_play[playerid][i]);
            PlayerTextDrawHide(playerid, pMusic_SongName[playerid][i]);
        }

        for (new i = 0; i < rows; i++)
        {
            // other data...
            cache_get_field_content(i, "songName", name, SQLConnectionId, 18);
            Page_Total[playerid] = cache_get_field_content_int(i, "total");

            PlayerTextDrawShow(playerid, pMusic_cover[playerid][i]);
            PlayerTextDrawShow(playerid, pMusic_chit[playerid][i]);
            PlayerTextDrawShow(playerid, pMusic_play[playerid][i]);
            PlayerTextDrawSetString(playerid, pMusic_SongName[playerid][i], name);
            PlayerTextDrawShow(playerid, pMusic_SongName[playerid][i]);
        }
        PlayerTextDrawSetString(playerid, pMusic_page[playerid], "%d/%d", Page[playerid] + 1, Max_Page(Page_Total[playerid], PAGE_LIMIT_OFFSET));
    }
    return 1;
}

Music_Query(playerid)
{
    mysql_format(SQLConnectionId, queryBuffer, sizeof(queryBuffer), "SELECT *, (SELECT COUNT(*) FROM music) AS total FROM music LIMIT %d, %d;", (Page[playerid] * PAGE_LIMIT_OFFSET), PAGE_LIMIT_OFFSET);
    mysql_tquery(SQLConnectionId, queryBuffer, "Music_Query_Loaded", "i", playerid);
    return 1;
}
stock PhoneMusic(playerid, bool:Hide)
{
    if (!Hide)
    {
        phoneStatus[playerid][PHONE_MUSIC_SHOWN] = true;
        PhoneHomeScreen(playerid, true);
        PhoneBody(playerid, false, false, 2070474495);
        PhoneNavbar(playerid, false);

        pMusic_page[playerid] = CreatePlayerTextDraw(playerid, 514.000, 206.000, "1/3");
        PlayerTextDrawLetterSize(playerid, pMusic_page[playerid], 0.209, 1.297);
        PlayerTextDrawAlignment(playerid, pMusic_page[playerid], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, pMusic_page[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pMusic_page[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pMusic_page[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pMusic_page[playerid], 150);
        PlayerTextDrawFont(playerid, pMusic_page[playerid], TEXT_DRAW_FONT_2);
        PlayerTextDrawSetProportional(playerid, pMusic_page[playerid], true);

        pMusic_AddSong[playerid] = CreatePlayerTextDraw(playerid, 585.000, 206.000, "Add Song");
        PlayerTextDrawLetterSize(playerid, pMusic_AddSong[playerid], 0.195, 1.098);
        PlayerTextDrawTextSize(playerid, pMusic_AddSong[playerid], 10.000, 47.000);
        PlayerTextDrawAlignment(playerid, pMusic_AddSong[playerid], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, pMusic_AddSong[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pMusic_AddSong[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pMusic_AddSong[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pMusic_AddSong[playerid], 150);
        PlayerTextDrawFont(playerid, pMusic_AddSong[playerid], TEXT_DRAW_FONT_2);
        PlayerTextDrawSetProportional(playerid, pMusic_AddSong[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pMusic_AddSong[playerid], true);

        pMusic_bCover[playerid] = CreatePlayerTextDraw(playerid, 499.000, 376.000, "mdl-1005:container");
        PlayerTextDrawTextSize(playerid, pMusic_bCover[playerid], 121.000, 45.000);
        PlayerTextDrawAlignment(playerid, pMusic_bCover[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pMusic_bCover[playerid], -1976835329);
        PlayerTextDrawSetShadow(playerid, pMusic_bCover[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pMusic_bCover[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pMusic_bCover[playerid], 255);
        PlayerTextDrawFont(playerid, pMusic_bCover[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pMusic_bCover[playerid], true);

        pMusic_bControl[playerid] = CreatePlayerTextDraw(playerid, 541.000, 376.000, "LD_BEAT:chit");
        PlayerTextDrawTextSize(playerid, pMusic_bControl[playerid], 35.000, 35.000);
        PlayerTextDrawAlignment(playerid, pMusic_bControl[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pMusic_bControl[playerid], -931138817);
        PlayerTextDrawSetShadow(playerid, pMusic_bControl[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pMusic_bControl[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pMusic_bControl[playerid], 255);
        PlayerTextDrawFont(playerid, pMusic_bControl[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pMusic_bControl[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pMusic_bControl[playerid], true);

        pMusic_bControl_img[playerid] = CreatePlayerTextDraw(playerid, 542.000, 377.000, "mdl-1006:button-play");
        PlayerTextDrawTextSize(playerid, pMusic_bControl_img[playerid], 35.000, 35.000);
        PlayerTextDrawAlignment(playerid, pMusic_bControl_img[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pMusic_bControl_img[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pMusic_bControl_img[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pMusic_bControl_img[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pMusic_bControl_img[playerid], 255);
        PlayerTextDrawFont(playerid, pMusic_bControl_img[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pMusic_bControl_img[playerid], true);

        pMusic_bprev[playerid] = CreatePlayerTextDraw(playerid, 513.000, 382.000, "LD_BEAT:chit");
        PlayerTextDrawTextSize(playerid, pMusic_bprev[playerid], 25.000, 25.000);
        PlayerTextDrawAlignment(playerid, pMusic_bprev[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pMusic_bprev[playerid], -931138817);
        PlayerTextDrawSetShadow(playerid, pMusic_bprev[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pMusic_bprev[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pMusic_bprev[playerid], 255);
        PlayerTextDrawFont(playerid, pMusic_bprev[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pMusic_bprev[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pMusic_bprev[playerid], true);

        pMusic_bprev_img[playerid] = CreatePlayerTextDraw(playerid, 514.000, 383.000, "mdl-1006:button-prev");
        PlayerTextDrawTextSize(playerid, pMusic_bprev_img[playerid], 25.000, 25.000);
        PlayerTextDrawAlignment(playerid, pMusic_bprev_img[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pMusic_bprev_img[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pMusic_bprev_img[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pMusic_bprev_img[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pMusic_bprev_img[playerid], 255);
        PlayerTextDrawFont(playerid, pMusic_bprev_img[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pMusic_bprev_img[playerid], true);

        pMusic_bnext[playerid] = CreatePlayerTextDraw(playerid, 578.000, 382.000, "LD_BEAT:chit");
        PlayerTextDrawTextSize(playerid, pMusic_bnext[playerid], 25.000, 25.000);
        PlayerTextDrawAlignment(playerid, pMusic_bnext[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pMusic_bnext[playerid], -931138817);
        PlayerTextDrawSetShadow(playerid, pMusic_bnext[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pMusic_bnext[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pMusic_bnext[playerid], 255);
        PlayerTextDrawFont(playerid, pMusic_bnext[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pMusic_bnext[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pMusic_bnext[playerid], true);

        pMusic_bnext_img[playerid] = CreatePlayerTextDraw(playerid, 579.000, 383.000, "mdl-1006:button-next");
        PlayerTextDrawTextSize(playerid, pMusic_bnext_img[playerid], 25.000, 25.000);
        PlayerTextDrawAlignment(playerid, pMusic_bnext_img[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pMusic_bnext_img[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pMusic_bnext_img[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pMusic_bnext_img[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pMusic_bnext_img[playerid], 255);
        PlayerTextDrawFont(playerid, pMusic_bnext_img[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pMusic_bnext_img[playerid], true);

        PlayerTextDrawShow(playerid, pMusic_page[playerid]);
        PlayerTextDrawShow(playerid, pMusic_AddSong[playerid]);
        PlayerTextDrawShow(playerid, pMusic_bCover[playerid]);
        PlayerTextDrawShow(playerid, pMusic_bControl[playerid]);
        PlayerTextDrawShow(playerid, pMusic_bprev[playerid]);
        PlayerTextDrawShow(playerid, pMusic_bControl_img[playerid]);
        PlayerTextDrawShow(playerid, pMusic_bprev_img[playerid]);
        PlayerTextDrawShow(playerid, pMusic_bnext[playerid]);
        PlayerTextDrawShow(playerid, pMusic_bnext_img[playerid]);

        checkaudiostream(playerid);
        backbtn(playerid, false);
        new Float:y = 224.0;

        for (new i = 0; i < p_Max_Contect_Perpage; i++)
        {

            pMusic_cover[playerid][i] = CreatePlayerTextDraw(playerid, 502.000, y, "mdl-1005:container");
            PlayerTextDrawTextSize(playerid, pMusic_cover[playerid][i], 115.000, 27.000);
            PlayerTextDrawAlignment(playerid, pMusic_cover[playerid][i], TEXT_DRAW_ALIGN_LEFT);
            PlayerTextDrawColour(playerid, pMusic_cover[playerid][i], -1724723969);
            PlayerTextDrawSetShadow(playerid, pMusic_cover[playerid][i], 0);
            PlayerTextDrawSetOutline(playerid, pMusic_cover[playerid][i], 0);
            PlayerTextDrawBackgroundColour(playerid, pMusic_cover[playerid][i], 255);
            PlayerTextDrawFont(playerid, pMusic_cover[playerid][i], TEXT_DRAW_FONT_SPRITE_DRAW);
            PlayerTextDrawSetProportional(playerid, pMusic_cover[playerid][i], true);
            PlayerTextDrawSetSelectable(playerid, pMusic_cover[playerid][i], true);

            pMusic_chit[playerid][i] = CreatePlayerTextDraw(playerid, 503.000, y + 1, "LD_BEAT:chit");
            PlayerTextDrawTextSize(playerid, pMusic_chit[playerid][i], 25.000, 25.000);
            PlayerTextDrawAlignment(playerid, pMusic_chit[playerid][i], TEXT_DRAW_ALIGN_LEFT);
            PlayerTextDrawColour(playerid, pMusic_chit[playerid][i], -931138817);
            PlayerTextDrawSetShadow(playerid, pMusic_chit[playerid][i], 0);
            PlayerTextDrawSetOutline(playerid, pMusic_chit[playerid][i], 0);
            PlayerTextDrawBackgroundColour(playerid, pMusic_chit[playerid][i], 255);
            PlayerTextDrawFont(playerid, pMusic_chit[playerid][i], TEXT_DRAW_FONT_SPRITE_DRAW);
            PlayerTextDrawSetProportional(playerid, pMusic_chit[playerid][i], true);

            pMusic_play[playerid][i] = CreatePlayerTextDraw(playerid, 504.000, y + 2, "mdl-1006:button-play");
            PlayerTextDrawTextSize(playerid, pMusic_play[playerid][i], 25.000, 25.000);
            PlayerTextDrawAlignment(playerid, pMusic_play[playerid][i], TEXT_DRAW_ALIGN_LEFT);
            PlayerTextDrawColour(playerid, pMusic_play[playerid][i], -1);
            PlayerTextDrawSetShadow(playerid, pMusic_play[playerid][i], 0);
            PlayerTextDrawSetOutline(playerid, pMusic_play[playerid][i], 0);
            PlayerTextDrawBackgroundColour(playerid, pMusic_play[playerid][i], 255);
            PlayerTextDrawFont(playerid, pMusic_play[playerid][i], TEXT_DRAW_FONT_SPRITE_DRAW);
            PlayerTextDrawSetProportional(playerid, pMusic_play[playerid][i], true);

            pMusic_SongName[playerid][i] = CreatePlayerTextDraw(playerid, 528.000, y + 7, "Song Name");
            PlayerTextDrawLetterSize(playerid, pMusic_SongName[playerid][i], 0.250, 1.000);
            PlayerTextDrawTextSize(playerid, pMusic_SongName[playerid][i], 608.000, 0.000);
            PlayerTextDrawAlignment(playerid, pMusic_SongName[playerid][i], TEXT_DRAW_ALIGN_LEFT);
            PlayerTextDrawColour(playerid, pMusic_SongName[playerid][i], -1);
            PlayerTextDrawSetShadow(playerid, pMusic_SongName[playerid][i], 0);
            PlayerTextDrawSetOutline(playerid, pMusic_SongName[playerid][i], 0);
            PlayerTextDrawBackgroundColour(playerid, pMusic_SongName[playerid][i], 150);
            PlayerTextDrawFont(playerid, pMusic_SongName[playerid][i], TEXT_DRAW_FONT_1);
            PlayerTextDrawSetProportional(playerid, pMusic_SongName[playerid][i], true);

            y += 30;
        }
        Music_Query(playerid);

    }
    else
    {
        for (new i = 0; i < PAGE_LIMIT_OFFSET; i++)
        {
            PlayerTextDrawDestroy(playerid, pMusic_cover[playerid][i]);
            PlayerTextDrawDestroy(playerid, pMusic_chit[playerid][i]);
            PlayerTextDrawDestroy(playerid, pMusic_play[playerid][i]);
            PlayerTextDrawDestroy(playerid, pMusic_SongName[playerid][i]);
        }

        PlayerTextDrawDestroy(playerid, pMusic_page[playerid]);
        PlayerTextDrawDestroy(playerid, pMusic_AddSong[playerid]);
        PlayerTextDrawDestroy(playerid, pMusic_bCover[playerid]);
        PlayerTextDrawDestroy(playerid, pMusic_bControl[playerid]);
        PlayerTextDrawDestroy(playerid, pMusic_bprev[playerid]);
        PlayerTextDrawDestroy(playerid, pMusic_bControl_img[playerid]);
        PlayerTextDrawDestroy(playerid, pMusic_bprev_img[playerid]);
        PlayerTextDrawDestroy(playerid, pMusic_bnext[playerid]);
        PlayerTextDrawDestroy(playerid, pMusic_bnext_img[playerid]);

        phoneStatus[playerid][PHONE_MUSIC_SHOWN] = false;
        PhoneHomeScreen(playerid, true);
        PhoneHomeScreen(playerid, false);
    }
}


stock PhoneHomeIcon(playerid, bool:Hide)
{
    if (!Hide)
    {
        p_icon[playerid][0] = CreatePlayerTextDraw(playerid, 502.000, 369.000, "mdl-1005:container");
        PlayerTextDrawTextSize(playerid, p_icon[playerid][0], 115.000, 40.000);
        PlayerTextDrawAlignment(playerid, p_icon[playerid][0], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, p_icon[playerid][0], 70);
        PlayerTextDrawSetShadow(playerid, p_icon[playerid][0], 0);
        PlayerTextDrawSetOutline(playerid, p_icon[playerid][0], 0);
        PlayerTextDrawBackgroundColour(playerid, p_icon[playerid][0], 255);
        PlayerTextDrawFont(playerid, p_icon[playerid][0], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, p_icon[playerid][0], true);

        p_icon[playerid][1] = CreatePlayerTextDraw(playerid, 510.000, 222.000, "mdl-1006:notes");
        PlayerTextDrawTextSize(playerid, p_icon[playerid][1], 21.000, 24.000);
        PlayerTextDrawAlignment(playerid, p_icon[playerid][1], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, p_icon[playerid][1], -1);
        PlayerTextDrawSetShadow(playerid, p_icon[playerid][1], 0);
        PlayerTextDrawSetOutline(playerid, p_icon[playerid][1], 0);
        PlayerTextDrawBackgroundColour(playerid, p_icon[playerid][1], 255);
        PlayerTextDrawFont(playerid, p_icon[playerid][1], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, p_icon[playerid][1], true);
        PlayerTextDrawSetSelectable(playerid, p_icon[playerid][1], true);

        p_icon[playerid][2] = CreatePlayerTextDraw(playerid, 536.000, 222.000, "mdl-1006:camera");
        PlayerTextDrawTextSize(playerid, p_icon[playerid][2], 21.000, 24.000);
        PlayerTextDrawAlignment(playerid, p_icon[playerid][2], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, p_icon[playerid][2], -1);
        PlayerTextDrawSetShadow(playerid, p_icon[playerid][2], 0);
        PlayerTextDrawSetOutline(playerid, p_icon[playerid][2], 0);
        PlayerTextDrawBackgroundColour(playerid, p_icon[playerid][2], 255);
        PlayerTextDrawFont(playerid, p_icon[playerid][2], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, p_icon[playerid][2], true);
        PlayerTextDrawSetSelectable(playerid, p_icon[playerid][2], true);


        p_icon[playerid][3] = CreatePlayerTextDraw(playerid, 561.000, 222.000, "mdl-1006:music");
        PlayerTextDrawTextSize(playerid, p_icon[playerid][3], 21.000, 24.000);
        PlayerTextDrawAlignment(playerid, p_icon[playerid][3], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, p_icon[playerid][3], -1);
        PlayerTextDrawSetShadow(playerid, p_icon[playerid][3], 0);
        PlayerTextDrawSetOutline(playerid, p_icon[playerid][3], 0);
        PlayerTextDrawBackgroundColour(playerid, p_icon[playerid][3], 255);
        PlayerTextDrawFont(playerid, p_icon[playerid][3], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, p_icon[playerid][3], true);
        PlayerTextDrawSetSelectable(playerid, p_icon[playerid][3], true);

        p_icon[playerid][4] = CreatePlayerTextDraw(playerid, 586.000, 222.000, "mdl-1006:calculator");
        PlayerTextDrawTextSize(playerid, p_icon[playerid][4], 21.000, 24.000);
        PlayerTextDrawAlignment(playerid, p_icon[playerid][4], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, p_icon[playerid][4], -1);
        PlayerTextDrawSetShadow(playerid, p_icon[playerid][4], 0);
        PlayerTextDrawSetOutline(playerid, p_icon[playerid][4], 0);
        PlayerTextDrawBackgroundColour(playerid, p_icon[playerid][4], 255);
        PlayerTextDrawFont(playerid, p_icon[playerid][4], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, p_icon[playerid][4], true);
        PlayerTextDrawSetSelectable(playerid, p_icon[playerid][4], true);

        p_icon[playerid][5] = CreatePlayerTextDraw(playerid, 510.000, 376.000, "mdl-1006:phone");
        PlayerTextDrawTextSize(playerid, p_icon[playerid][5], 21.000, 24.000);
        PlayerTextDrawAlignment(playerid, p_icon[playerid][5], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, p_icon[playerid][5], -1);
        PlayerTextDrawSetShadow(playerid, p_icon[playerid][5], 0);
        PlayerTextDrawSetOutline(playerid, p_icon[playerid][5], 0);
        PlayerTextDrawBackgroundColour(playerid, p_icon[playerid][5], 255);
        PlayerTextDrawFont(playerid, p_icon[playerid][5], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, p_icon[playerid][5], true);
        PlayerTextDrawSetSelectable(playerid, p_icon[playerid][5], true);

        p_icon[playerid][6] = CreatePlayerTextDraw(playerid, 536.000, 376.000, "mdl-1006:settings");
        PlayerTextDrawTextSize(playerid, p_icon[playerid][6], 21.000, 24.000);
        PlayerTextDrawAlignment(playerid, p_icon[playerid][6], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, p_icon[playerid][6], -1);
        PlayerTextDrawSetShadow(playerid, p_icon[playerid][6], 0);
        PlayerTextDrawSetOutline(playerid, p_icon[playerid][6], 0);
        PlayerTextDrawBackgroundColour(playerid, p_icon[playerid][6], 255);
        PlayerTextDrawFont(playerid, p_icon[playerid][6], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, p_icon[playerid][6], true);
        PlayerTextDrawSetSelectable(playerid, p_icon[playerid][6], true);

        p_icon[playerid][7] = CreatePlayerTextDraw(playerid, 561.000, 376.000, "mdl-1006:safari");
        PlayerTextDrawTextSize(playerid, p_icon[playerid][7], 21.000, 24.000);
        PlayerTextDrawAlignment(playerid, p_icon[playerid][7], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, p_icon[playerid][7], -1);
        PlayerTextDrawSetShadow(playerid, p_icon[playerid][7], 0);
        PlayerTextDrawSetOutline(playerid, p_icon[playerid][7], 0);
        PlayerTextDrawBackgroundColour(playerid, p_icon[playerid][7], 255);
        PlayerTextDrawFont(playerid, p_icon[playerid][7], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, p_icon[playerid][7], true);
        PlayerTextDrawSetSelectable(playerid, p_icon[playerid][7], true);

        p_icon[playerid][8] = CreatePlayerTextDraw(playerid, 586.000, 376.000, "mdl-1006:contact");
        PlayerTextDrawTextSize(playerid, p_icon[playerid][8], 21.000, 24.000);
        PlayerTextDrawAlignment(playerid, p_icon[playerid][8], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, p_icon[playerid][8], -1);
        PlayerTextDrawSetShadow(playerid, p_icon[playerid][8], 0);
        PlayerTextDrawSetOutline(playerid, p_icon[playerid][8], 0);
        PlayerTextDrawBackgroundColour(playerid, p_icon[playerid][8], 255);
        PlayerTextDrawFont(playerid, p_icon[playerid][8], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, p_icon[playerid][8], true);
        PlayerTextDrawSetSelectable(playerid, p_icon[playerid][8], true);

        for (new i = 0; i < PhoneHomeIcons; i++)
        {
            PlayerTextDrawShow(playerid, p_icon[playerid][i]);
        }
    }
    else
    {
        for (new i = 0; i < PhoneHomeIcons; i++)
        {

            PlayerTextDrawDestroy(playerid, p_icon[playerid][i]);
        }
    }
}

stock PhoneNavbar(playerid, bool:Hide)
{
    if (!Hide)
    {

        p_nav_network[playerid] = CreatePlayerTextDraw(playerid, 580.000, 192.000, (Settings[playerid][apmode] == 1) ? "mdl-1006:airplane" : "mdl-1006:connectivity-bar");
        PlayerTextDrawTextSize(playerid, p_nav_network[playerid], 15.000, 11.000);
        PlayerTextDrawAlignment(playerid, p_nav_network[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, p_nav_network[playerid], -1);
        PlayerTextDrawSetShadow(playerid, p_nav_network[playerid], 0);
        PlayerTextDrawSetOutline(playerid, p_nav_network[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, p_nav_network[playerid], 255);
        PlayerTextDrawFont(playerid, p_nav_network[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, p_nav_network[playerid], true);

        p_nav_battery[playerid] = CreatePlayerTextDraw(playerid, 594.000, 194.000, "mdl-1007:battery-80");
        PlayerTextDrawTextSize(playerid, p_nav_battery[playerid], 15.000, 9.000);
        PlayerTextDrawAlignment(playerid, p_nav_battery[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, p_nav_battery[playerid], -1);
        PlayerTextDrawSetShadow(playerid, p_nav_battery[playerid], 0);
        PlayerTextDrawSetOutline(playerid, p_nav_battery[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, p_nav_battery[playerid], 255);
        PlayerTextDrawFont(playerid, p_nav_battery[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, p_nav_battery[playerid], true);

        TextDrawShowForPlayer(playerid, p_nav_time);
        PlayerTextDrawShow(playerid, p_nav_network[playerid]);
        PlayerTextDrawShow(playerid, p_nav_battery[playerid]);

    }
    else
    {

        TextDrawHideForPlayer(playerid, p_nav_time);
        PlayerTextDrawDestroy(playerid, p_nav_network[playerid]);
        PlayerTextDrawDestroy(playerid, p_nav_battery[playerid]);

    }
}

stock PhoneHomeScreen(playerid, bool:Hide)
{
    if (!Hide)
    {
        phoneStatus[playerid][PHONE_HOME_SHOWN] = true;
        PhoneBody(playerid, 1, false);
        PhoneNavbar(playerid, false);
        PhoneHomeIcon(playerid, false);
        backbtn(playerid, false);
    }
    else
    {
        phoneStatus[playerid][PHONE_HOME_SHOWN] = false;
        PhoneBody(playerid, 1, true);
        PhoneNavbar(playerid, true);
        PhoneHomeIcon(playerid, true);
        backbtn(playerid, true);

    }
}

stock PhoneBody(playerid, bool:imagebackground, bool:Hide, bgColour = -1)
{
    if (!Hide)
    {
        if (imagebackground)
        {

            p_background[playerid] = CreatePlayerTextDraw(playerid, 499.000, 191.000, Settings[playerid][currentWallpaper]);
            PlayerTextDrawTextSize(playerid, p_background[playerid], 118.000, 232.000);
            PlayerTextDrawAlignment(playerid, p_background[playerid], TEXT_DRAW_ALIGN_LEFT);
            PlayerTextDrawColour(playerid, p_background[playerid], -1);
            PlayerTextDrawSetShadow(playerid, p_background[playerid], 0);
            PlayerTextDrawSetOutline(playerid, p_background[playerid], 0);
            PlayerTextDrawBackgroundColour(playerid, p_background[playerid], 255);
            PlayerTextDrawFont(playerid, p_background[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
            PlayerTextDrawSetProportional(playerid, p_background[playerid], true);


            p_body[playerid] = CreatePlayerTextDraw(playerid, 492.000, 187.000, "mdl-1005:body");
            PlayerTextDrawTextSize(playerid, p_body[playerid], 130.000, 240.000);
            PlayerTextDrawAlignment(playerid, p_body[playerid], TEXT_DRAW_ALIGN_LEFT);
            PlayerTextDrawColour(playerid, p_body[playerid], -1);
            PlayerTextDrawSetShadow(playerid, p_body[playerid], 0);
            PlayerTextDrawSetOutline(playerid, p_body[playerid], 0);
            PlayerTextDrawBackgroundColour(playerid, p_body[playerid], 255);
            PlayerTextDrawFont(playerid, p_body[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
            PlayerTextDrawSetProportional(playerid, p_body[playerid], true);

            PlayerTextDrawShow(playerid, p_background[playerid]);

        }
        else
        {

            p_whitebackground[playerid] = CreatePlayerTextDraw(playerid, 558.000, 195.000, "_");
            PlayerTextDrawLetterSize(playerid, p_whitebackground[playerid], 0.300, 24.697);
            PlayerTextDrawTextSize(playerid, p_whitebackground[playerid], 0.000, 114.000);
            PlayerTextDrawAlignment(playerid, p_whitebackground[playerid], TEXT_DRAW_ALIGN_CENTER);
            PlayerTextDrawColour(playerid, p_whitebackground[playerid], -1);
            PlayerTextDrawUseBox(playerid, p_whitebackground[playerid], true);
            PlayerTextDrawBoxColour(playerid, p_whitebackground[playerid], bgColour);
            PlayerTextDrawSetShadow(playerid, p_whitebackground[playerid], 1);
            PlayerTextDrawSetOutline(playerid, p_whitebackground[playerid], 1);
            PlayerTextDrawBackgroundColour(playerid, p_whitebackground[playerid], 150);
            PlayerTextDrawFont(playerid, p_whitebackground[playerid], TEXT_DRAW_FONT_1);
            PlayerTextDrawSetProportional(playerid, p_whitebackground[playerid], true);

            p_body[playerid] = CreatePlayerTextDraw(playerid, 492.000, 187.000, "mdl-1005:body");
            PlayerTextDrawTextSize(playerid, p_body[playerid], 130.000, 240.000);
            PlayerTextDrawAlignment(playerid, p_body[playerid], TEXT_DRAW_ALIGN_LEFT);
            PlayerTextDrawColour(playerid, p_body[playerid], -1);
            PlayerTextDrawSetShadow(playerid, p_body[playerid], 0);
            PlayerTextDrawSetOutline(playerid, p_body[playerid], 0);
            PlayerTextDrawBackgroundColour(playerid, p_body[playerid], 255);
            PlayerTextDrawFont(playerid, p_body[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
            PlayerTextDrawSetProportional(playerid, p_body[playerid], true);

            PlayerTextDrawShow(playerid, p_whitebackground[playerid]);

        }
        PlayerTextDrawShow(playerid, p_body[playerid]);
    }
    else
    {

        PlayerTextDrawDestroy(playerid, p_background[playerid]);
        PlayerTextDrawDestroy(playerid, p_whitebackground[playerid]);
        PlayerTextDrawDestroy(playerid, p_body[playerid]);

    }
}

stock PhoneCalculator(playerid, bool:Hide)
{
    if (!Hide)
    {
        phoneStatus[playerid][PHONE_CALCULATOR_SHOWN] = true;
        PhoneHomeScreen(playerid, true);
        PhoneBody(playerid, false, false, 858993663);
        PhoneNavbar(playerid, false);
        backbtn(playerid, false);

        p_calculator[playerid][0] = CreatePlayerTextDraw(playerid, 515.000, 266.000, "AC");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][0], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][0], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][0], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][0], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][0], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][0], -1515870721);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][0], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][0], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][0], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][0], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][0], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][0], true);

        p_calculator[playerid][1] = CreatePlayerTextDraw(playerid, 543.000, 266.000, "C");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][1], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][1], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][1], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][1], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][1], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][1], -1515870721);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][1], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][1], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][1], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][1], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][1], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][1], true);

        p_calculator[playerid][2] = CreatePlayerTextDraw(playerid, 571.000, 266.000, "Sq");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][2], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][2], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][2], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][2], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][2], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][2], -1515870721);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][2], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][2], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][2], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][2], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][2], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][2], true);

        p_calculator[playerid][3] = CreatePlayerTextDraw(playerid, 599.000, 266.000, "+");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][3], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][3], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][3], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][3], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][3], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][3], -23065857);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][3], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][3], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][3], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][3], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][3], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][3], true);

        p_calculator[playerid][4] = CreatePlayerTextDraw(playerid, 599.000, 293.000, "-");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][4], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][4], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][4], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][4], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][4], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][4], -23065857);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][4], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][4], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][4], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][4], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][4], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][4], true);

        p_calculator[playerid][5] = CreatePlayerTextDraw(playerid, 599.000, 320.000, "x");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][5], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][5], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][5], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][5], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][5], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][5], -23065857);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][5], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][5], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][5], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][5], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][5], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][5], true);

        p_calculator[playerid][6] = CreatePlayerTextDraw(playerid, 599.000, 347.000, "/");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][6], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][6], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][6], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][6], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][6], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][6], -23065857);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][6], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][6], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][6], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][6], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][6], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][6], true);

        p_calculator[playerid][7] = CreatePlayerTextDraw(playerid, 599.000, 374.000, "=");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][7], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][7], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][7], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][7], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][7], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][7], -23065857);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][7], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][7], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][7], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][7], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][7], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][7], true);

        p_calculator[playerid][8] = CreatePlayerTextDraw(playerid, 515.000, 293.000, "7");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][8], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][8], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][8], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][8], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][8], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][8], 1768516095);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][8], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][8], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][8], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][8], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][8], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][8], true);

        p_calculator[playerid][9] = CreatePlayerTextDraw(playerid, 543.000, 293.000, "8");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][9], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][9], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][9], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][9], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][9], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][9], 1768516095);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][9], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][9], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][9], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][9], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][9], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][9], true);

        p_calculator[playerid][10] = CreatePlayerTextDraw(playerid, 571.000, 293.000, "9");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][10], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][10], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][10], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][10], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][10], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][10], 1768516095);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][10], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][10], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][10], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][10], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][10], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][10], true);

        p_calculator[playerid][11] = CreatePlayerTextDraw(playerid, 515.000, 320.000, "4");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][11], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][11], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][11], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][11], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][11], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][11], 1768516095);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][11], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][11], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][11], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][11], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][11], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][11], true);

        p_calculator[playerid][12] = CreatePlayerTextDraw(playerid, 543.000, 320.000, "5");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][12], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][12], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][12], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][12], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][12], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][12], 1768516095);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][12], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][12], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][12], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][12], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][12], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][12], true);

        p_calculator[playerid][13] = CreatePlayerTextDraw(playerid, 571.000, 320.000, "6");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][13], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][13], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][13], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][13], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][13], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][13], 1768516095);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][13], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][13], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][13], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][13], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][13], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][13], true);

        p_calculator[playerid][14] = CreatePlayerTextDraw(playerid, 515.000, 347.000, "1");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][14], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][14], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][14], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][14], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][14], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][14], 1768516095);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][14], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][14], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][14], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][14], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][14], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][14], true);

        p_calculator[playerid][15] = CreatePlayerTextDraw(playerid, 543.000, 347.000, "2");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][15], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][15], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][15], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][15], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][15], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][15], 1768516095);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][15], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][15], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][15], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][15], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][15], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][15], true);

        p_calculator[playerid][16] = CreatePlayerTextDraw(playerid, 571.000, 347.000, "3");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][16], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][16], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][16], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][16], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][16], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][16], 1768516095);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][16], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][16], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][16], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][16], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][16], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][16], true);

        p_calculator[playerid][17] = CreatePlayerTextDraw(playerid, 529.000, 374.000, "0");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][17], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][17], 20.000, 48.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][17], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][17], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][17], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][17], 1768516095);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][17], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][17], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][17], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][17], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][17], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][17], true);

        p_calculator[playerid][18] = CreatePlayerTextDraw(playerid, 571.000, 374.000, ".");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][18], 0.409, 2.098);
        PlayerTextDrawTextSize(playerid, p_calculator[playerid][18], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][18], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, p_calculator[playerid][18], -1);
        PlayerTextDrawUseBox(playerid, p_calculator[playerid][18], true);
        PlayerTextDrawBoxColour(playerid, p_calculator[playerid][18], 1768516095);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][18], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][18], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][18], 150);
        PlayerTextDrawFont(playerid, p_calculator[playerid][18], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][18], true);
        PlayerTextDrawSetSelectable(playerid, p_calculator[playerid][18], true);

        p_calculator[playerid][19] = CreatePlayerTextDraw(playerid, 612.000, 220.000, "");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][19], 0.208, 0.999);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][19], TEXT_DRAW_ALIGN_RIGHT);
        PlayerTextDrawColour(playerid, p_calculator[playerid][19], 1887473919);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][19], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][19], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][19], -1329275137);
        PlayerTextDrawFont(playerid, p_calculator[playerid][19], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][19], true);

        p_calculator[playerid][20] = CreatePlayerTextDraw(playerid, 612.000, 230.000, "");
        PlayerTextDrawLetterSize(playerid, p_calculator[playerid][20], 0.507, 2.598);
        PlayerTextDrawAlignment(playerid, p_calculator[playerid][20], TEXT_DRAW_ALIGN_RIGHT);
        PlayerTextDrawColour(playerid, p_calculator[playerid][20], -1);
        PlayerTextDrawSetShadow(playerid, p_calculator[playerid][20], 0);
        PlayerTextDrawSetOutline(playerid, p_calculator[playerid][20], 0);
        PlayerTextDrawBackgroundColour(playerid, p_calculator[playerid][20], -1329275137);
        PlayerTextDrawFont(playerid, p_calculator[playerid][20], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, p_calculator[playerid][20], true);

        for (new i = 0; i < 21; i++)
        {
            PlayerTextDrawShow(playerid, p_calculator[playerid][i]);
        }

    }
    else
    {
        phoneStatus[playerid][PHONE_CALCULATOR_SHOWN] = false;

        for (new i = 0; i < 21; i++)
        {
            PlayerTextDrawDestroy(playerid, p_calculator[playerid][i]);
        }
        PhoneHomeScreen(playerid, true);
        PhoneHomeScreen(playerid, false);
    }
}

hook OnGameModeInit()
{

    p_nav_time = TextDrawCreate(516.000, 193.000, "00:00");
    TextDrawLetterSize(p_nav_time, 0.148, 0.998);
    TextDrawTextSize(p_nav_time, 0.000, 20.000);
    TextDrawAlignment(p_nav_time, TEXT_DRAW_ALIGN_CENTER);
    TextDrawColour(p_nav_time, -1);
    TextDrawSetShadow(p_nav_time, 1);
    TextDrawSetOutline(p_nav_time, 1);
    TextDrawBackgroundColour(p_nav_time, 150);
    TextDrawFont(p_nav_time, TEXT_DRAW_FONT_2);
    TextDrawSetProportional(p_nav_time, 1);

    return 1;
}
stock backbtn(playerid, bool:Hide)
{
    if (!Hide)
    {
        p_icon[playerid][9] = CreatePlayerTextDraw(playerid, 535.000, 413.000, "mdl-1005:container");
        PlayerTextDrawTextSize(playerid, p_icon[playerid][9], 46.000, 6.000);
        PlayerTextDrawAlignment(playerid, p_icon[playerid][9], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, p_icon[playerid][9], 240);
        PlayerTextDrawSetShadow(playerid, p_icon[playerid][9], 0);
        PlayerTextDrawSetOutline(playerid, p_icon[playerid][9], 0);
        PlayerTextDrawBackgroundColour(playerid, p_icon[playerid][9], 255);
        PlayerTextDrawFont(playerid, p_icon[playerid][9], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, p_icon[playerid][9], true);
        PlayerTextDrawSetSelectable(playerid, p_icon[playerid][9], true);

        PlayerTextDrawShow(playerid, p_icon[playerid][9]);
    }
    else
    {
        PlayerTextDrawDestroy(playerid, p_icon[playerid][9]);
    }
}
hook OnPlayerConnect(playerid)
{
    mysql_tquery(SQLConnectionId, "SELECT bg FROM phone", "getWallpaper", "i", playerid);
    phoneStatus[playerid][PHONE_CAMERA__SHWON] = false;
    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
    phoneStatus[playerid][PHONE_CAMERA__SHWON] = false;

    return 1;
}
stock OnbackbtnClick(playerid)
{
    if (phoneStatus[playerid][PHONE_HOME_SHOWN])
    {
        PhoneHomeScreen(playerid, true);
        CancelSelectTextDraw(playerid);
        phoneStatus[playerid][PHONE_SHOWN] = false;
    }
    else if (phoneStatus[playerid][PHONE_CALCULATOR_SHOWN])
    {
        format(calcLogic[playerid][string], 11, "");
        calcLogic[playerid][value1] = 0;
        calcLogic[playerid][value2] = 0;
        calcLogic[playerid][result] = 0;
        PhoneCalculator(playerid, true);
    }
    else if (phoneStatus[playerid][PHONE_CONTECTS_SHOWN])
    {
        PhoneContectsBase(playerid, true);
    }
    else if (phoneStatus[playerid][PHONE_DIALPAD_SHOWN])
    {
        PhoneDialPadScreen(playerid, true);
        format(DialKey[playerid], 11, "");
    }
    else if (phoneStatus[playerid][PHONE_MUSIC_SHOWN])
    {
        PhoneMusic(playerid, true);
    }
    else if (phoneStatus[playerid][PHONE_SETTINGS_SHOWN])
    {
        settingScreen(playerid, true);
    }
    else if (phoneStatus[playerid][PHONE_CHANGEWALLPAPER_SHWON])
    {
        changeWallpaper(playerid, true);
    }
    Load_Phone(playerid);

}
enum
{
    DIALOG_AddContectName,
    DIALOG_AddContectNumber,
    DIALOG_ContectOpe,
    DIALOG_DIALPAD_ADDCON,
    DIALOG_AddMusic1,
    DIALOG_AddMusic2,
    DIALOG_MusicOpe
};
stock PhoneDialPadScreen(playerid, bool:Hide)
{
    if (!Hide)
    {
        phoneStatus[playerid][PHONE_DIALPAD_SHOWN] = true;
        PhoneHomeScreen(playerid, true);
        PhoneBody(playerid, false, false, -167773441);
        PhoneNavbar(playerid, false);
        backbtn(playerid, false);


        pDialPad_deletebtn[playerid] = CreatePlayerTextDraw(playerid, 582.000, 366.000, "mdl-1006:delete-text");
        PlayerTextDrawTextSize(playerid, pDialPad_deletebtn[playerid], 20.000, 25.000);
        PlayerTextDrawAlignment(playerid, pDialPad_deletebtn[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pDialPad_deletebtn[playerid], 2005433163);
        PlayerTextDrawSetShadow(playerid, pDialPad_deletebtn[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pDialPad_deletebtn[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pDialPad_deletebtn[playerid], 255);
        PlayerTextDrawFont(playerid, pDialPad_deletebtn[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pDialPad_deletebtn[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pDialPad_deletebtn[playerid], true);

        pDialPad_addcon[playerid] = CreatePlayerTextDraw(playerid, 558.000, 240.000, "Add Contact");
        PlayerTextDrawLetterSize(playerid, pDialPad_addcon[playerid], 0.208, 1.098);
        PlayerTextDrawTextSize(playerid, pDialPad_addcon[playerid], 15.000, 45.000);
        PlayerTextDrawAlignment(playerid, pDialPad_addcon[playerid], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, pDialPad_addcon[playerid], 1097458175);
        PlayerTextDrawSetShadow(playerid, pDialPad_addcon[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pDialPad_addcon[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pDialPad_addcon[playerid], 150);
        PlayerTextDrawFont(playerid, pDialPad_addcon[playerid], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, pDialPad_addcon[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pDialPad_addcon[playerid], true);

        pDialPad_numtext[playerid] = CreatePlayerTextDraw(playerid, 519.000, 263.000, "1    2    3~n~~n~4    5    6~n~~n~7    8    9~n~~n~     0");
        PlayerTextDrawLetterSize(playerid, pDialPad_numtext[playerid], 0.358, 2.000);
        PlayerTextDrawAlignment(playerid, pDialPad_numtext[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pDialPad_numtext[playerid], 255);
        PlayerTextDrawSetShadow(playerid, pDialPad_numtext[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pDialPad_numtext[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pDialPad_numtext[playerid], 150);
        PlayerTextDrawFont(playerid, pDialPad_numtext[playerid], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, pDialPad_numtext[playerid], false);

        pDialPad_call[playerid] = CreatePlayerTextDraw(playerid, 511.000, 367.000, "mdl-1006:call-accept");
        PlayerTextDrawTextSize(playerid, pDialPad_call[playerid], 25.000, 25.000);
        PlayerTextDrawAlignment(playerid, pDialPad_call[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pDialPad_call[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pDialPad_call[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pDialPad_call[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pDialPad_call[playerid], 255);
        PlayerTextDrawFont(playerid, pDialPad_call[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pDialPad_call[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pDialPad_call[playerid], true);

        pDialPad_shownumtext[playerid] = CreatePlayerTextDraw(playerid, 558.000, 219.000, "_");
        PlayerTextDrawLetterSize(playerid, pDialPad_shownumtext[playerid], 0.358, 2.000);
        PlayerTextDrawAlignment(playerid, pDialPad_shownumtext[playerid], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, pDialPad_shownumtext[playerid], 255);
        PlayerTextDrawSetShadow(playerid, pDialPad_shownumtext[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pDialPad_shownumtext[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pDialPad_shownumtext[playerid], 150);
        PlayerTextDrawFont(playerid, pDialPad_shownumtext[playerid], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, pDialPad_shownumtext[playerid], true);

        new Float:px = 473,
            Float:py = 259;

        for (new i = 0, idx = 0; i < 10; i++)
        {
            if (idx > 0 && (idx % 3) == 0)
            {
                px = 508;
                py += 35.0;
            }
            else
            {
                px += 35.0;
            }
            idx++;
            if (i == 9) px = 544;

            pDialPad[playerid][i] = CreatePlayerTextDraw(playerid, px, py, "LD_POOL:ball");
            PlayerTextDrawTextSize(playerid, pDialPad[playerid][i], 30.000, 30.000);
            PlayerTextDrawAlignment(playerid, pDialPad[playerid][i], TEXT_DRAW_ALIGN_LEFT);
            PlayerTextDrawColour(playerid, pDialPad[playerid][i], 2005433163);
            PlayerTextDrawSetShadow(playerid, pDialPad[playerid][i], 0);
            PlayerTextDrawSetOutline(playerid, pDialPad[playerid][i], 0);
            PlayerTextDrawBackgroundColour(playerid, pDialPad[playerid][i], 255);
            PlayerTextDrawFont(playerid, pDialPad[playerid][i], TEXT_DRAW_FONT_SPRITE_DRAW);
            PlayerTextDrawSetProportional(playerid, pDialPad[playerid][i], true);
            PlayerTextDrawSetSelectable(playerid, pDialPad[playerid][i], true);

        }

        for (new i = 0 ; i < 10; i++)
        {
            PlayerTextDrawShow(playerid, pDialPad[playerid][i]);
        }

        PlayerTextDrawShow(playerid, pDialPad_deletebtn[playerid]);
        PlayerTextDrawShow(playerid, pDialPad_addcon[playerid]);
        PlayerTextDrawShow(playerid, pDialPad_numtext[playerid]);
        PlayerTextDrawShow(playerid, pDialPad_call[playerid]);
        PlayerTextDrawShow(playerid, pDialPad_shownumtext[playerid]);

    }
    else
    {

        for (new i = 0; i < 10; i++)
        {
            PlayerTextDrawDestroy(playerid, pDialPad[playerid][i]);
        }
        PlayerTextDrawDestroy(playerid, pDialPad_deletebtn[playerid]);
        PlayerTextDrawDestroy(playerid, pDialPad_addcon[playerid]);
        PlayerTextDrawDestroy(playerid, pDialPad_numtext[playerid]);
        PlayerTextDrawDestroy(playerid, pDialPad_call[playerid]);
        PlayerTextDrawDestroy(playerid, pDialPad_shownumtext[playerid]);


        phoneStatus[playerid][PHONE_DIALPAD_SHOWN] = false;
        PhoneHomeScreen(playerid, true);
        PhoneHomeScreen(playerid, false);
    }

}

stock changeWallpaper(playerid, bool:Hide)
{
    if (!Hide)
    {
        phoneStatus[playerid][PHONE_CHANGEWALLPAPER_SHWON] = true;
        settingScreen(playerid, true);
        PhoneHomeScreen(playerid, true);


        pWallpaper_bgscreen[playerid] = CreatePlayerTextDraw(playerid, 499.000, 191.000, "mdl-1005:background");
        PlayerTextDrawTextSize(playerid, pWallpaper_bgscreen[playerid], 118.000, 232.000);
        PlayerTextDrawAlignment(playerid, pWallpaper_bgscreen[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pWallpaper_bgscreen[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pWallpaper_bgscreen[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pWallpaper_bgscreen[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pWallpaper_bgscreen[playerid], 255);
        PlayerTextDrawFont(playerid, pWallpaper_bgscreen[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pWallpaper_bgscreen[playerid], true);

        p_body[playerid] = CreatePlayerTextDraw(playerid, 492.000, 187.000, "mdl-1005:body");
        PlayerTextDrawTextSize(playerid, p_body[playerid], 130.000, 240.000);
        PlayerTextDrawAlignment(playerid, p_body[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, p_body[playerid], -1);
        PlayerTextDrawSetShadow(playerid, p_body[playerid], 0);
        PlayerTextDrawSetOutline(playerid, p_body[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, p_body[playerid], 255);
        PlayerTextDrawFont(playerid, p_body[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, p_body[playerid], true);

        PhoneNavbar(playerid, false);

        pWallpaper_page[playerid] = CreatePlayerTextDraw(playerid, 560.000, 386.000, "0/0");
        PlayerTextDrawLetterSize(playerid, pWallpaper_page[playerid], 0.209, 1.297);
        PlayerTextDrawAlignment(playerid, pWallpaper_page[playerid], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, pWallpaper_page[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pWallpaper_page[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pWallpaper_page[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pWallpaper_page[playerid], 150);
        PlayerTextDrawFont(playerid, pWallpaper_page[playerid], TEXT_DRAW_FONT_2);
        PlayerTextDrawSetProportional(playerid, pWallpaper_page[playerid], true);

        pWallpaper_container[playerid] = CreatePlayerTextDraw(playerid, 499.000, 376.000, "mdl-1005:container");
        PlayerTextDrawTextSize(playerid, pWallpaper_container[playerid], 121.000, 45.000);
        PlayerTextDrawAlignment(playerid, pWallpaper_container[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pWallpaper_container[playerid], 1887473919);
        PlayerTextDrawSetShadow(playerid, pWallpaper_container[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pWallpaper_container[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pWallpaper_container[playerid], 255);
        PlayerTextDrawFont(playerid, pWallpaper_container[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pWallpaper_container[playerid], true);

        pWallpaper_apply[playerid] = CreatePlayerTextDraw(playerid, 597.000, 202.000, "apply");
        PlayerTextDrawLetterSize(playerid, pWallpaper_apply[playerid], 0.194, 1.098);
        PlayerTextDrawTextSize(playerid, pWallpaper_apply[playerid], 10.000, 55.000);
        PlayerTextDrawAlignment(playerid, pWallpaper_apply[playerid], TEXT_DRAW_ALIGN_CENTER);
        PlayerTextDrawColour(playerid, pWallpaper_apply[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pWallpaper_apply[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pWallpaper_apply[playerid], 1);
        PlayerTextDrawBackgroundColour(playerid, pWallpaper_apply[playerid], 150);
        PlayerTextDrawFont(playerid, pWallpaper_apply[playerid], TEXT_DRAW_FONT_2);
        PlayerTextDrawSetProportional(playerid, pWallpaper_apply[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pWallpaper_apply[playerid], true);

        pWallpaper_prev[playerid] = CreatePlayerTextDraw(playerid, 516.000, 384.000, "mdl-1006:left");
        PlayerTextDrawTextSize(playerid, pWallpaper_prev[playerid], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, pWallpaper_prev[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pWallpaper_prev[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pWallpaper_prev[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pWallpaper_prev[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pWallpaper_prev[playerid], 255);
        PlayerTextDrawFont(playerid, pWallpaper_prev[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pWallpaper_prev[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pWallpaper_prev[playerid], true);

        pWallpaper_next[playerid] = CreatePlayerTextDraw(playerid, 581.000, 384.000, "mdl-1006:right");
        PlayerTextDrawTextSize(playerid, pWallpaper_next[playerid], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, pWallpaper_next[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pWallpaper_next[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pWallpaper_next[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pWallpaper_next[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pWallpaper_next[playerid], 255);
        PlayerTextDrawFont(playerid, pWallpaper_next[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pWallpaper_next[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pWallpaper_next[playerid], true);

        PlayerTextDrawShow(playerid, p_body[playerid]);
        PlayerTextDrawShow(playerid, pWallpaper_bgscreen[playerid]);
        PlayerTextDrawShow(playerid, pWallpaper_page[playerid]);
        PlayerTextDrawShow(playerid, pWallpaper_container[playerid]);
        PlayerTextDrawShow(playerid, pWallpaper_apply[playerid]);
        PlayerTextDrawShow(playerid, pWallpaper_prev[playerid]);
        PlayerTextDrawShow(playerid, pWallpaper_next[playerid]);
        backbtn(playerid, false);
        PlayerTextDrawSetString(playerid, pWallpaper_page[playerid],"%d/%d",Page[playerid] +1,TOTAL_WALLPAPERS +1);

    }
    else
    {
        PlayerTextDrawDestroy(playerid, pWallpaper_bgscreen[playerid]);
        PlayerTextDrawDestroy(playerid, pWallpaper_page[playerid]);
        PlayerTextDrawDestroy(playerid, pWallpaper_container[playerid]);
        PlayerTextDrawDestroy(playerid, pWallpaper_apply[playerid]);
        PlayerTextDrawDestroy(playerid, pWallpaper_prev[playerid]);
        PlayerTextDrawDestroy(playerid, pWallpaper_next[playerid]);
        phoneStatus[playerid][PHONE_CHANGEWALLPAPER_SHWON] = false;
        PhoneBody(playerid, 0, 1);
        settingScreen(playerid, false);
    }
}
stock settingScreen(playerid, bool:Hide)
{
    if (!Hide)
    {
        phoneStatus[playerid][PHONE_SETTINGS_SHOWN] = true;
        PhoneHomeScreen(playerid, true);
        PhoneBody(playerid, false, false, -1);
        PhoneNavbar(playerid, false);
        backbtn(playerid, false);

        pSetting_settingText[playerid] = CreatePlayerTextDraw(playerid, 505.000, 205.000, "Settings");
        PlayerTextDrawLetterSize(playerid, pSetting_settingText[playerid], 0.289, 1.598);
        PlayerTextDrawTextSize(playerid, pSetting_settingText[playerid], 608.000, 0.000);
        PlayerTextDrawAlignment(playerid, pSetting_settingText[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pSetting_settingText[playerid], 255);
        PlayerTextDrawSetShadow(playerid, pSetting_settingText[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pSetting_settingText[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pSetting_settingText[playerid], 150);
        PlayerTextDrawFont(playerid, pSetting_settingText[playerid], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, pSetting_settingText[playerid], true);

        pSetting_AmContainer[playerid] = CreatePlayerTextDraw(playerid, 502.000, 224.000, "mdl-1005:container");
        PlayerTextDrawTextSize(playerid, pSetting_AmContainer[playerid], 115.000, 27.000);
        PlayerTextDrawAlignment(playerid, pSetting_AmContainer[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pSetting_AmContainer[playerid], 1887473919);
        PlayerTextDrawSetShadow(playerid, pSetting_AmContainer[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pSetting_AmContainer[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pSetting_AmContainer[playerid], 255);
        PlayerTextDrawFont(playerid, pSetting_AmContainer[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pSetting_AmContainer[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pSetting_AmContainer[playerid], true);

        pSetting_Amtext[playerid] = CreatePlayerTextDraw(playerid, 506.000, 233.000, "Airplane Mode");
        PlayerTextDrawLetterSize(playerid, pSetting_Amtext[playerid], 0.250, 1.000);
        PlayerTextDrawTextSize(playerid, pSetting_Amtext[playerid], 608.000, 0.000);
        PlayerTextDrawAlignment(playerid, pSetting_Amtext[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pSetting_Amtext[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pSetting_Amtext[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pSetting_Amtext[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pSetting_Amtext[playerid], 150);
        PlayerTextDrawFont(playerid, pSetting_Amtext[playerid], 1);
        PlayerTextDrawSetProportional(playerid, pSetting_Amtext[playerid], true);

        pSetting_Amswitch[playerid] = CreatePlayerTextDraw(playerid, 585.000, 228.000, "mdl-1006:switch-off");
        PlayerTextDrawTextSize(playerid, pSetting_Amswitch[playerid], 20.000, 20.000);
        PlayerTextDrawAlignment(playerid, pSetting_Amswitch[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pSetting_Amswitch[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pSetting_Amswitch[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pSetting_Amswitch[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pSetting_Amswitch[playerid], 255);
        PlayerTextDrawFont(playerid, pSetting_Amswitch[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pSetting_Amswitch[playerid], true);

        pSetting_changWall_container[playerid] = CreatePlayerTextDraw(playerid, 502.000, 254.000, "mdl-1005:container");
        PlayerTextDrawTextSize(playerid, pSetting_changWall_container[playerid], 115.000, 27.000);
        PlayerTextDrawAlignment(playerid, pSetting_changWall_container[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pSetting_changWall_container[playerid], 1887473919);
        PlayerTextDrawSetShadow(playerid, pSetting_changWall_container[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pSetting_changWall_container[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pSetting_changWall_container[playerid], 255);
        PlayerTextDrawFont(playerid, pSetting_changWall_container[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pSetting_changWall_container[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pSetting_changWall_container[playerid], true);

        pSetting_changeWallText[playerid] = CreatePlayerTextDraw(playerid, 506.000, 263.000, "Change Wallpaper");
        PlayerTextDrawLetterSize(playerid, pSetting_changeWallText[playerid], 0.250, 1.000);
        PlayerTextDrawTextSize(playerid, pSetting_changeWallText[playerid], 608.000, 0.000);
        PlayerTextDrawAlignment(playerid, pSetting_changeWallText[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pSetting_changeWallText[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pSetting_changeWallText[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pSetting_changeWallText[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pSetting_changeWallText[playerid], 150);
        PlayerTextDrawFont(playerid, pSetting_changeWallText[playerid], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, pSetting_changeWallText[playerid], 1);

        pSetting_AboutContainer[playerid] = CreatePlayerTextDraw(playerid, 502.000, 284.000, "mdl-1005:container");
        PlayerTextDrawTextSize(playerid, pSetting_AboutContainer[playerid], 115.000, 27.000);
        PlayerTextDrawAlignment(playerid, pSetting_AboutContainer[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pSetting_AboutContainer[playerid], 1887473919);
        PlayerTextDrawSetShadow(playerid, pSetting_AboutContainer[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pSetting_AboutContainer[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pSetting_AboutContainer[playerid], 255);
        PlayerTextDrawFont(playerid, pSetting_AboutContainer[playerid], TEXT_DRAW_FONT_SPRITE_DRAW);
        PlayerTextDrawSetProportional(playerid, pSetting_AboutContainer[playerid], true);
        PlayerTextDrawSetSelectable(playerid, pSetting_AboutContainer[playerid], true);

        pSetting_AboutText[playerid] = CreatePlayerTextDraw(playerid, 506.000, 293.000, "About Phone");
        PlayerTextDrawLetterSize(playerid, pSetting_AboutText[playerid], 0.250, 1.000);
        PlayerTextDrawTextSize(playerid, pSetting_AboutText[playerid], 608.000, 0.000);
        PlayerTextDrawAlignment(playerid, pSetting_AboutText[playerid], TEXT_DRAW_ALIGN_LEFT);
        PlayerTextDrawColour(playerid, pSetting_AboutText[playerid], -1);
        PlayerTextDrawSetShadow(playerid, pSetting_AboutText[playerid], 0);
        PlayerTextDrawSetOutline(playerid, pSetting_AboutText[playerid], 0);
        PlayerTextDrawBackgroundColour(playerid, pSetting_AboutText[playerid], 150);
        PlayerTextDrawFont(playerid, pSetting_AboutText[playerid], TEXT_DRAW_FONT_1);
        PlayerTextDrawSetProportional(playerid, pSetting_AboutText[playerid], true);

        PlayerTextDrawShow(playerid, pSetting_settingText[playerid]);
        PlayerTextDrawShow(playerid, pSetting_AmContainer[playerid]);
        PlayerTextDrawShow(playerid, pSetting_Amtext[playerid]);
        PlayerTextDrawShow(playerid, pSetting_Amswitch[playerid]);
        PlayerTextDrawShow(playerid, pSetting_changWall_container[playerid]);
        PlayerTextDrawShow(playerid, pSetting_changeWallText[playerid]);
        PlayerTextDrawShow(playerid, pSetting_AboutContainer[playerid]);
        PlayerTextDrawShow(playerid, pSetting_AboutText[playerid]);

        PlayerTextDrawSetString(playerid, pSetting_Amswitch[playerid], (Settings[playerid][apmode] == 1) ? "mdl-1006:switch-on" : "mdl-1006:switch-off");
    }
    else
    {
        phoneStatus[playerid][PHONE_SETTINGS_SHOWN] = false;

        PlayerTextDrawDestroy(playerid, pSetting_settingText[playerid]);
        PlayerTextDrawDestroy(playerid, pSetting_AmContainer[playerid]);
        PlayerTextDrawDestroy(playerid, pSetting_Amtext[playerid]);
        PlayerTextDrawDestroy(playerid, pSetting_Amswitch[playerid]);
        PlayerTextDrawDestroy(playerid, pSetting_changWall_container[playerid]);
        PlayerTextDrawDestroy(playerid, pSetting_changeWallText[playerid]);
        PlayerTextDrawDestroy(playerid, pSetting_AboutContainer[playerid]);
        PlayerTextDrawDestroy(playerid, pSetting_AboutText[playerid]);

        PhoneHomeScreen(playerid, true);
        PhoneHomeScreen(playerid, false);
    }
}
ShowDialogToPlayer(playerid, dialogid)
{
    switch (dialogid)
    {
        case DIALOG_AddContectName:
        {
            ShowPlayerDialog(playerid, DIALOG_AddContectName, DIALOG_STYLE_INPUT, "Add Contect", "Enter the Contect Name", "Next", "Cancel");
        }
        case DIALOG_AddContectNumber:
        {
            ShowPlayerDialog(playerid, DIALOG_AddContectNumber, DIALOG_STYLE_INPUT, "Add Contect", "Enter the Contect Number", "Create", "Cancel");
        }
        case DIALOG_DIALPAD_ADDCON:
        {
            new stringD[64];
            format(stringD, sizeof(stringD), "Add Number - %s To Contect\nEnter the Contect Name", DialString[playerid]);
            ShowPlayerDialog(playerid, DIALOG_DIALPAD_ADDCON, DIALOG_STYLE_INPUT, "Add Contect", stringD, "Create", "Cancel");
        }
        case DIALOG_AddMusic1:
        {
            ShowPlayerDialog(playerid, DIALOG_AddMusic1, DIALOG_STYLE_INPUT, "Add Music", "Enter Music Title", "Next", "Cancel");
        }
        case DIALOG_AddMusic2:
        {
            ShowPlayerDialog(playerid, DIALOG_AddMusic2, DIALOG_STYLE_INPUT, "Add Music", "Enter Url", "Create", "Cancel");
        }
    }
}
forward OnAirPlaneModeClick(playerid);
public OnAirPlaneModeClick(playerid)
{
    Settings[playerid][apmode] = cache_get_field_content_int(0, "apmode", SQLConnectionId);

    if (Settings[playerid][apmode] == 1)
    {
        Settings[playerid][apmode] = 0;
        PlayerTextDrawSetString(playerid, p_nav_network[playerid], "mdl-1006:connectivity-bar");
        SendClientMessage(playerid, COLOR_AQUA, "Phone enabled. You can now receive calls and texts again.");
        PlayerTextDrawSetString(playerid, pSetting_Amswitch[playerid], "mdl-1006:switch-off");
        mysql_tquery(SQLConnectionId, "UPDATE phone SET apmode = 0");
    }
    else
    {
        Settings[playerid][apmode] = 1;
        PlayerTextDrawSetString(playerid, p_nav_network[playerid], "mdl-1006:airplane");
        SendClientMessage(playerid, COLOR_AQUA, "Phone toggled. You will no longer receive calls or texts.");
        PlayerTextDrawSetString(playerid, pSetting_Amswitch[playerid], "mdl-1006:switch-on");
        mysql_tquery(SQLConnectionId, "UPDATE phone SET apmode = 1");
    }
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch (dialogid)
    {
        case DIALOG_AddContectName:
        {
            if (response)
            {
                if (isnull(inputtext))
                {
                    ShowDialogToPlayer(playerid, DIALOG_AddContectName);
                    return 1;
                }
                format(contects[playerid][contectName], 15, "%s", inputtext);
                ShowDialogToPlayer(playerid, DIALOG_AddContectNumber);
            }

        }
        case DIALOG_AddContectNumber:
        {
            if (response)
            {
                if (isnull(inputtext))
                {
                    ShowDialogToPlayer(playerid, DIALOG_AddContectName);
                }
                contects[playerid][contectNumber] = strval(inputtext);

                AddContect(playerid,  contects[playerid][contectName], contects[playerid][contectNumber]);
            }
        }
        case DIALOG_ContectOpe:
        {
            if (response)
            {
                if (listitem == 0)
                {
                    SendClientMessage(playerid, -1, "Calling Currently Unavailibal");
                }
                if (listitem == 1)
                {
                    SendClientMessage(playerid, -1, "SMS Currently Unavailibal");
                }
                if (listitem == 2)
                {
                    mysql_format(SQLConnectionId, queryBuffer, sizeof(queryBuffer), "DELETE FROM contects WHERE Cname = '%s'", contects[playerid][contectName]);
                    mysql_tquery(SQLConnectionId, queryBuffer);
                    Page_Query(playerid);
                    SendClientMessage(playerid, -1, "Contect Deleted %s", contects[playerid][contectName]);
                }

            }
        }
        case DIALOG_DIALPAD_ADDCON:
        {
            if (response)
            {
                mysql_format(SQLConnectionId, queryBuffer, sizeof(queryBuffer), "INSERT INTO contects (Cname, Cnumber) VALUES('%s', %d)", inputtext, strval(DialString[playerid]));
                mysql_tquery(SQLConnectionId, queryBuffer);
                SendClientMessage(playerid, -1, "Number Successfully Added");
                format(DialString[playerid], 25, "");
                PlayerTextDrawSetString(playerid, pDialPad_shownumtext[playerid], DialString[playerid]);

            }
        }
        case DIALOG_MusicOpe:
        {
            if (response)
            {
                if (listitem == 0)
                {
                    format(Musicinfo[playerid][songUrl], 256, Musicinfo[playerid][songUrl]);
                    PlayAudioStreamForPlayer(playerid, Musicinfo[playerid][songUrl]);
                    Musicinfo[playerid][play] = true;
                    checkaudiostream(playerid);
                }
                if (listitem == 1)
                {
                    mysql_format(SQLConnectionId, queryBuffer, sizeof(queryBuffer), "DELETE FROM music WHERE songName = '%s'", Musicinfo[playerid][songName]);
                    mysql_tquery(SQLConnectionId, queryBuffer);
                    SendClientMessage(playerid, -1, "Deleted Song - %s", Musicinfo[playerid][songName]);
                    Music_Query(playerid);
                }
            }
        }
        case DIALOG_AddMusic1:
        {
            if (response)
            {
                format(Musicinfo[playerid][songName], 18, inputtext);
                ShowDialogToPlayer(playerid, DIALOG_AddMusic2);
            }
        }
        case DIALOG_AddMusic2:
        {
            if (response)
            {
                format(Musicinfo[playerid][songUrl], 256, inputtext);
                mysql_format(SQLConnectionId, queryBuffer, sizeof(queryBuffer), "INSERT INTO music (songName, songUrl) VALUES('%s', '%s')",  Musicinfo[playerid][songName],  Musicinfo[playerid][songUrl]);
                mysql_tquery(SQLConnectionId, queryBuffer);
                SendClientMessage(playerid, -1, "Successfully Added");
                Music_Query(playerid);
            }
        }
    }
    return 1;
}

hook OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    if (playertextid == p_icon[playerid][9])
    {
        OnbackbtnClick(playerid);
    }

    //calculator    phoneStatus[playerid][PHONE_CHANGEWALLPAPER_SHWON]
    if (phoneStatus[playerid][PHONE_CALCULATOR_SHOWN])
    {
        for (new i = 0; i < 21; i++)
        {
            if (playertextid ==  p_calculator[playerid][i])
            {
                calcLogic[playerid][calkey] = i;
                PlayerTextDrawGetString(playerid, p_calculator[playerid][i], calcLogic[playerid][calkey], 2);
                switch (calcLogic[playerid][calkey])
                {
                    case '+', '-', 'x', '/':
                    {
                        calcLogic[playerid][opera] = true;
                        calcLogic[playerid][operandc] = calcLogic[playerid][calkey][0];
                        calcLogic[playerid][value1] = floatstr(calcLogic[playerid][string]);
                        format(calcLogic[playerid][string], 11, "");
                    }
                    case 'S':
                    {
                        calcLogic[playerid][opera] = true;
                        calcLogic[playerid][value1] = floatstr(calcLogic[playerid][string]);
                        PlayerTextDrawSetString(playerid, p_calculator[playerid][19], "sqr(%1.f)", calcLogic[playerid][value1]);
                        format(calcLogic[playerid][string], 11, "%.1f", calcLogic[playerid][value1] * calcLogic[playerid][value1]);

                    }
                    case 'A':
                    {
                        format(calcLogic[playerid][string], 11, "");
                        calcLogic[playerid][value1] = 0;
                        calcLogic[playerid][value2] = 0;
                        calcLogic[playerid][result] = 0;
                        calcLogic[playerid][opera] = true;
                        PlayerTextDrawSetString(playerid, p_calculator[playerid][19], "");

                    }
                    case 'C':
                    {
                        calcLogic[playerid][opera] = true;
                        plength = strlen(calcLogic[playerid][string]);
                        strdel(calcLogic[playerid][string], plength - 1, plength);

                    }
                    case '=':
                    {
                        calcLogic[playerid][opera] = true;
                        calcLogic[playerid][value2] = floatstr(calcLogic[playerid][string]);
                        if (calcLogic[playerid][operandc] == '-')
                        {
                            calcLogic[playerid][result] = calcLogic[playerid][value1] - calcLogic[playerid][value2];
                        }
                        if (calcLogic[playerid][operandc] == '+')
                        {
                            calcLogic[playerid][result] = calcLogic[playerid][value1] + calcLogic[playerid][value2];
                        }
                        if (calcLogic[playerid][operandc] == 'x')
                        {
                            calcLogic[playerid][result] = calcLogic[playerid][value1] * calcLogic[playerid][value2];
                        }
                        if (calcLogic[playerid][operandc] == '/')
                        {
                            calcLogic[playerid][result] = calcLogic[playerid][value1] / calcLogic[playerid][value2];
                        }
                        PlayerTextDrawSetString(playerid, p_calculator[playerid][19], "%.1f %c %.1f", calcLogic[playerid][value1], calcLogic[playerid][operandc], calcLogic[playerid][value2]);
                        format(calcLogic[playerid][string], 11, "%.1f", calcLogic[playerid][result]);
                    }
                    default:calcLogic[playerid][opera] = false;
                }

                if (!calcLogic[playerid][opera])
                    strcat(calcLogic[playerid][string], calcLogic[playerid][calkey]);

                PlayerTextDrawSetString(playerid, p_calculator[playerid][20], calcLogic[playerid][string]);
            }
        }

    }
    if (phoneStatus[playerid][PHONE_HOME_SHOWN])
    {
        //for PhoneHomeIcons
        if (playertextid == p_icon[playerid][1])  SendClientMessage(playerid, -1, "Notes script currently under development");
        if (playertextid == p_icon[playerid][2] && !phoneStatus[playerid][PHONE_CAMERA__SHWON])
        {
            CancelSelectTextDraw(playerid);
            phonecall(playerid);
            GetPlayerPos(playerid, lX[playerid], lY[playerid], lZ[playerid]);
            static Float:n1X, Float:n1Y;
            if (Degree[playerid] >= 360) Degree[playerid] = 0;
            Degree[playerid] += Speed;
            n1X = lX[playerid] + Radius * floatcos(Degree[playerid], degrees);
            n1Y = lY[playerid] + Radius * floatsin(Degree[playerid], degrees);
            SetPlayerCameraPos(playerid, n1X, n1Y, lZ[playerid] + Height);
            SetPlayerCameraLookAt(playerid, lX[playerid], lY[playerid], lZ[playerid] + 1);
            SetPlayerFacingAngle(playerid, Degree[playerid] - 90.0);
            phoneStatus[playerid][PHONE_CAMERA__SHWON] = true;
            ApplyAnimation(playerid, "PED", "gang_gunstand", 4.1, 1, 1, 1, 1, 1, 1);
            SendClientMessage(playerid, -1, "Press F8 to take a selfie, Num 6/Num 4 to move the camera");
            SendClientMessage(playerid, -1, "Press 'N' stop taking selfies, /headmove to disable the head movement.");
        }
        if (playertextid == p_icon[playerid][3])   PhoneMusic(playerid, false);
        if (playertextid == p_icon[playerid][4])  PhoneCalculator(playerid, false);
        if (playertextid == p_icon[playerid][5])  PhoneDialPadScreen(playerid, false);
        if (playertextid == p_icon[playerid][6])  settingScreen(playerid, false);
        if (playertextid == p_icon[playerid][7])  SendClientMessage(playerid, -1, "Safari script currently under development");
        if (playertextid == p_icon[playerid][8])  PhoneContectsBase(playerid, false);
    }

    if (playertextid == p_icon[playerid][9]) OnbackbtnClick(playerid);
    //contect list
    if (phoneStatus[playerid][PHONE_CONTECTS_SHOWN])
    {
        for (new i = 0; i < p_Max_Contect_Perpage; i++)
        {
            if (playertextid == pContect_Cover[playerid][i])
            {
                mysql_format(SQLConnectionId, queryBuffer, sizeof(queryBuffer), "SELECT *, (SELECT COUNT(*) FROM contects) AS total FROM contects LIMIT %d, %d;", (Page[playerid] * PAGE_LIMIT_OFFSET), PAGE_LIMIT_OFFSET);
                mysql_tquery(SQLConnectionId, queryBuffer, "ContectOpe", "dd", playerid, i);
            }
        }
        if (playertextid == pContect_bcreate[playerid])
        {
            ShowDialogToPlayer(playerid, DIALOG_AddContectName);
        }

        if (playertextid == pContect_bprev[playerid])
        {
            if (Page[playerid]-- <= 0)
            {
                Page[playerid] = 0;
            }
            Page_Query(playerid);
            return 1;
        }

        if (playertextid == pContect_bNext[playerid])
        {
            if (Page[playerid]++ >= Max_Page(Page_Total[playerid], PAGE_LIMIT_OFFSET) - 1)
            {
                Page[playerid] = Max_Page(Page_Total[playerid], PAGE_LIMIT_OFFSET) - 1;
            }
            Page_Query(playerid);

        }
    }
    //////////////////Phone dialpad////////////////
    if (phoneStatus[playerid][PHONE_DIALPAD_SHOWN])
    {
        for (new i = 0 ; i < 10; i++)
        {
            if (playertextid  == pDialPad[playerid][i])
            {
                if (i >= 0 && i < 10)
                {
                    if (playertextid != pDialPad[playerid][9])
                    {
                        format(DialKey[playerid], 11, "%d", i + 1);
                    }
                    else
                    {
                        format(DialKey[playerid], 11, "0");
                    }
                    strcat(DialString[playerid], DialKey[playerid]);
                    PlayerTextDrawSetString(playerid, pDialPad_shownumtext[playerid], DialString[playerid]);
                }
            }
        }

        if (playertextid == pDialPad_deletebtn[playerid])
        {
            plength = strlen(DialString[playerid]);
            strdel(DialString[playerid], plength - 1, plength);
            PlayerTextDrawSetString(playerid, pDialPad_shownumtext[playerid], DialString[playerid]);
        }
        if (playertextid == pDialPad_addcon[playerid])
        {
            ShowDialogToPlayer(playerid, DIALOG_DIALPAD_ADDCON);
        }
        if (playertextid == pDialPad_call[playerid])
        {
            SendClientMessage(playerid, -1, "Currently Unavailiable");
        }
    }
    //-------------------------Music Baby------------------------------
    if (phoneStatus[playerid][PHONE_MUSIC_SHOWN])
    {
        for (new i = 0; i < p_Max_Contect_Perpage; i++)
        {
            if (playertextid == pMusic_cover[playerid][i])
            {
                mysql_format(SQLConnectionId, queryBuffer, sizeof(queryBuffer), "SELECT *, (SELECT COUNT(*) FROM music) AS total FROM music LIMIT %d, %d;", (Page[playerid] * PAGE_LIMIT_OFFSET), PAGE_LIMIT_OFFSET);
                mysql_tquery(SQLConnectionId, queryBuffer, "MusicOpe", "dd", playerid, i);
            }

        }
        if (playertextid == pMusic_AddSong[playerid])
        {
            ShowDialogToPlayer(playerid, DIALOG_AddMusic1);
        }
        if (playertextid == pMusic_bControl[playerid])
        {
            if (Musicinfo[playerid][play])
            {
                StopAudioStreamForPlayer(playerid);
                Musicinfo[playerid][play] = false;
            }
            else if (isnull(Musicinfo[playerid][songUrl]))
            {
                SendClientMessage(playerid, -1, "Selete a music before start/stop");
            }
            else
            {
                PlayAudioStreamForPlayer(playerid, Musicinfo[playerid][songUrl]);
                Musicinfo[playerid][play] = true;
            }
            checkaudiostream(playerid);
        }
        if (playertextid == pMusic_bprev[playerid])
        {
            if (Page[playerid]-- <= 0)
            {
                Page[playerid] = 0;
            }
            Music_Query(playerid);
            return 1;
        }
        if (playertextid == pMusic_bnext[playerid])
        {
            if (Page[playerid]++ >= Max_Page(Page_Total[playerid], PAGE_LIMIT_OFFSET) - 1)
            {
                Page[playerid] = Max_Page(Page_Total[playerid], PAGE_LIMIT_OFFSET) - 1;
            }
            Music_Query(playerid);
        }

    }
    // ----------------settings -------------------
    if (phoneStatus[playerid][PHONE_SETTINGS_SHOWN])
    {
        if (playertextid == pSetting_AmContainer[playerid])
        {
            mysql_tquery(SQLConnectionId, "SELECT apmode FROM phone", "OnAirPlaneModeClick", "i", playerid);

        }
        if (playertextid == pSetting_changWall_container[playerid])
        {
            changeWallpaper(playerid, false);
        }

    }
    if (phoneStatus[playerid][PHONE_CHANGEWALLPAPER_SHWON])
    {
        if (playertextid == pWallpaper_prev[playerid])
        {
            if (Page[playerid]-- <= 0)
            {
                Page[playerid] = 0;
            }
            PlayerTextDrawSetString(playerid, pWallpaper_bgscreen[playerid], wallpaperscreen[Page[playerid]]);

        }
        if (playertextid == pWallpaper_next[playerid])
        {
            if (Page[playerid]++ >= TOTAL_WALLPAPERS)
            {
                Page[playerid] = TOTAL_WALLPAPERS;
            }
            PlayerTextDrawSetString(playerid, pWallpaper_bgscreen[playerid], wallpaperscreen[Page[playerid]]);

        }
        if (playertextid == pWallpaper_apply[playerid])
        {

            mysql_format(SQLConnectionId, queryBuffer, sizeof(queryBuffer), "UPDATE phone SET bg = '%s'", wallpaperscreen[Page[playerid]]);
            mysql_tquery(SQLConnectionId, queryBuffer);

            mysql_tquery(SQLConnectionId, "SELECT bg FROM phone", "getWallpaper", "i", playerid);
            SendClientMessage(playerid,  0x9ACD32FF, "Wallpaper Changed");
        }
         PlayerTextDrawSetString(playerid, pWallpaper_page[playerid],"%d/%d",Page[playerid] +1,TOTAL_WALLPAPERS +1);
        
    }
    return 1;
}

forward MusicOpe(playerid, i);
public MusicOpe(playerid, i)
{
    new rows = cache_num_rows();
    new str[64];
    cache_get_field_content(i, "songName", Musicinfo[playerid][songName], SQLConnectionId, 18);
    cache_get_field_content(i, "songUrl", Musicinfo[playerid][songUrl], SQLConnectionId, 256);

    format(str, sizeof(str), "Title: %s", Musicinfo[playerid][songName]);

    ShowPlayerDialog(playerid, DIALOG_MusicOpe, DIALOG_STYLE_LIST, str, "Play\nDelete", "Select", "Back");
    return 1;
}

forward ContectOpe(playerid, i);
public ContectOpe(playerid, i)
{
    new rows = cache_num_rows();
    new str[128];
    cache_get_field_content(i, "Cname", contects[playerid][contectName], SQLConnectionId, MAX_PLAYER_NAME);
    // Page_Total[playerid] = cache_get_field_content_int(i, "total");
    contects[playerid][contectNumber] = cache_get_field_content_int(i, "Cnumber", contects[playerid][contectName]);

    format(str, sizeof(str), "Contect - %s | %d", contects[playerid][contectName], contects[playerid][contectNumber]);

    ShowPlayerDialog(playerid, DIALOG_ContectOpe, DIALOG_STYLE_LIST, str, "Call\nSMS\nDelete Contect", "Select", "Back");
    return 1;
}

hook OnPlayerKeyStateChange(playerid, KEY:newkeys, KEY:oldkeys)
{
    if (phoneStatus[playerid][PHONE_CAMERA__SHWON])
    {
        if (PRESSED(KEY_ANALOG_RIGHT))
        {
            GetPlayerPos(playerid, lX[playerid], lY[playerid], lZ[playerid]);
            static Float:n1X, Float:n1Y;
            if (Degree[playerid] >= 360) Degree[playerid] = 0;
            Degree[playerid] += Speed;
            n1X = lX[playerid] + Radius * floatcos(Degree[playerid], degrees);
            n1Y = lY[playerid] + Radius * floatsin(Degree[playerid], degrees);
            SetPlayerCameraPos(playerid, n1X, n1Y, lZ[playerid] + Height);
            SetPlayerCameraLookAt(playerid, lX[playerid], lY[playerid], lZ[playerid] + 1);
            SetPlayerFacingAngle(playerid, Degree[playerid] - 90.0);
        }
        if (PRESSED(KEY_ANALOG_LEFT))
        {
            GetPlayerPos(playerid, lX[playerid], lY[playerid], lZ[playerid]);
            static Float:n1X, Float:n1Y;
            if (Degree[playerid] >= 360) Degree[playerid] = 0;
            Degree[playerid] -= Speed;
            n1X = lX[playerid] + Radius * floatcos(Degree[playerid], degrees);
            n1Y = lY[playerid] + Radius * floatsin(Degree[playerid], degrees);
            SetPlayerCameraPos(playerid, n1X, n1Y, lZ[playerid] + Height);
            SetPlayerCameraLookAt(playerid, lX[playerid], lY[playerid], lZ[playerid] + 1);
            SetPlayerFacingAngle(playerid, Degree[playerid] - 90.0);
        }
    }
    if (newkeys &  KEY_NO)
    {
        if (phoneStatus[playerid][PHONE_CAMERA__SHWON])
        {
            TogglePlayerControllable(playerid, 1);
            SetCameraBehindPlayer(playerid);
            phoneStatus[playerid][PHONE_CAMERA__SHWON] = false;
            ApplyAnimation(playerid, "PED", "ATM", 4.1, 0, 1, 1, 0, 1, 1);
            phonecall(playerid);
        }
    }

    if (newkeys & KEY_YES)
    {
        // Command_AddAlt(YCMD:phone,"phone",true);
        phonecall(playerid);

    }
    return 1;
}

stock phonecall(playerid)
{

    if (!phoneStatus[playerid][PHONE_SHOWN])
    {
        PhoneHomeScreen(playerid, false);
        SelectTextDraw(playerid, 0x5EC4FF);
        phoneStatus[playerid][PHONE_SHOWN] = true;

    }
    else
    {
        if (phoneStatus[playerid][PHONE_CALCULATOR_SHOWN])
        {
            PhoneCalculator(playerid, true);
        }
        if (phoneStatus[playerid][PHONE_CONTECTS_SHOWN])
        {
            PhoneContectsBase(playerid, true);
        }
        PhoneHomeScreen(playerid, true);
        CancelSelectTextDraw(playerid);
        phoneStatus[playerid][PHONE_SHOWN] = false;
    }
}

YCMD:phone(playerid, params[], help)
{
    phonecall(playerid);

    return 1;
}
