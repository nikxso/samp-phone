## Click to Watch
[![Preview](https://github.com/user-attachments/assets/a3933601-c790-489b-bfad-51861f732766)](https://youtu.be/0iUqbm1-Ado?si=H0YRoCLJ1stIauuy)

This is a sample iPhone-style UI made using SA-MP TextDraws. It’s mostly UI only, not a full phone system, so don’t expect magic. I designed the TextDraws myself works with SA-MP 0.3.0DL 

The phone looks like a phone, but behind the scenes the logic is kinda meh. I used some very basic (and honestly stupid) SQL logic just to store things like contacts, music, radio channels, etc. It works, but it’s not clean, not optimized, and definitely not something you should blindly copy-paste into a serious gamemode.
Adapt it to your own gamemode however you want

Adding into Your gamemode 
```C
#include <YSI_Coding\y_hooks>
#include "script/phone.pwn"
 ```
then import Sql and define the Connection like

```C
new SQLConnectionID;

public OnGameModeInit()
{
    SQLConnectionID = mysql_connect("localhost", "user", "password", "database");
    
    if (SQLConnectionID == MYSQL_INVALID_HANDLE)
    {
        print("[PHONE] SQL connection failed (big L)");
    }
    else
    {
        print("[PHONE] SQL connected (somehow)");
    }
    return 1;
}
```
