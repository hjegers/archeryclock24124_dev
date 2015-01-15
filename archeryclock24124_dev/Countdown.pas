unit Countdown;

{*
Copyright (C) 2010-2014  Henk Jegers
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

for questions email to info@archeryclock.com

this software uses SDPO serial, SDL and MMSystem

Contributions: Yann Morere (Linux)
               Henk Jegers (initial version/Windows.)
*}

interface

uses
  {$IFDEF Windows}

  MMSystem, windows,
  {$ENDIF}
  {$IFDEF Unix}
  UTF8Process, sdl, sdl_mixer, unix,
  {$ENDIF}
  LCLIntf, LCLType, Synaser, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls, Spin, dateutils, DBCtrls,
  StrUtils, Menus, Grids, IniPropStorage, SdpoSerial, lNetComponents, FileUtil,
  SynEdit  , lNet;

{$DEFINE UseCThreads}
{$IFDEF UNIX}{$IFDEF UseCThreads}
//cthreads,
{$ENDIF}{$ENDIF}


type

  { TCountdownform }

  TCountdownform = class(TForm)
    fromhostrefresh: TLabel;
    BOTshooterlet: TLabel;
    LANselect: TCheckBox;
    TOPshootertxt: TLabel;
    topbot: TRadioButton;
    serialtimestamp: TTimer;
    practiselabel25m1p1: TLabel;
    GetHOSTsignallabel1: TLabel;
    nrof1ppractisearrows: TSpinEdit;
    onesix: TRadioButton;
    portnumberrec: TSpinEdit;
    selectport2: TCheckBox;
    onefive: TRadioButton;
    portnumber2: TSpinEdit;
    rotate25m1p: TCheckBox;
    arduinoselect1: TCheckBox;
    fromHOST: TEdit;
    GetHOSTsignallabel: TLabel;
    followtimer: TTimer;
    serverportlabel1: TLabel;
    LUDP1: TLUDPComponent;
    Receivenetworkpanel: TGroupBox;
    HOSTNAME: TEdit;
    emergencytext: TLabel;
    LANbox: TGroupBox;
    K8055select: TCheckBox;
    PCnameLabel: TLabel;
    portnumber1: TSpinEdit;
    serialport1: TComboBox;
    networktimestamp: TTimer;
    Shooter5: TLabel;
    Shooter6: TLabel;
    threetwo: TRadioButton;
    TOPshooterlet: TLabel;
    BOTshootertxt: TLabel;
    twothree: TRadioButton;
    USBserialbox: TGroupBox;
    IniPropStorage1: TIniPropStorage;
    inputbox: TGroupBox;
    serialinput: TRadioButton;
    LANinput: TRadioButton;
    showtarget: TCheckBox;
    button1: TLabel;
    button2: TLabel;
    button3: TLabel;
    button4: TLabel;
    button5: TLabel;
    finalstiming: TGroupBox;
    finalteamturns: TSpinEdit;
    finalturns: TSpinEdit;
    danger: TImage;
    viewleft: TRadioButton;
    greenfinal: TSpinEdit;
    greenfinalend: TSpinEdit;
    groupfinarrow: TGroupBox;
    groupfinend: TGroupBox;
    orangefinal: TSpinEdit;
    orangefinalend: TSpinEdit;
    redfinal: TSpinEdit;
    redfinalend: TSpinEdit;
    secgrnlabel2: TLabel;
    secgrnlabel3: TLabel;
    secorlabel2: TLabel;
    secorlabel3: TLabel;
    secredlabel2: TLabel;
    secredlabel3: TLabel;
    sectotlabel2: TLabel;
    sectotlabel3: TLabel;
    teststring: TLabel;
    exthwbox: TGroupBox;
    HWbutton1: TComboBox;
    HWbutton2: TComboBox;
    HWbutton3: TComboBox;
    HWbutton4: TComboBox;
    HWbutton5: TComboBox;
    followpannel: TPanel;
    leftrightbox: TGroupBox;
    soundsignallabel1: TLabel;
    soundsignallabel2: TLabel;
    soundsignallabel3: TLabel;
    ABCDperEND: TCheckBox;
    buzzicon2: TImage;
    buzzicon3: TImage;
    greenmenu: TImage;
    nrgreenbuzz: TSpinEdit;
    nrorangebuzz: TSpinEdit;
    nrredbuzz: TSpinEdit;
    orangemenu: TImage;
    redbox: TGroupBox;
    Manual: TRadioButton;
    follow: TRadioButton;
    manualpannel: TPanel;
    precountalways: TCheckBox;
    connect_switch_delay: TTimer;
    connect_delay: TTimer;
    doubleturnslabel: TLabel;
    FITAFINlabel: TLabel;
    BCDtoROG2label: TLabel;
    Aboutmemo: TMemo;
    followexplanation: TLabel;
    orangebox: TGroupBox;
    greenbox: TGroupBox;
    redmenu: TImage;
    serial: TSdpoSerial;
    abouttab: TTabSheet;
    buzzicon1: TImage;
    source: TStream;
    Shooter1: TLabel;
    Shooter2: TLabel;
    Shooter3: TLabel;
    Shooter4: TLabel;
    serienr: TLabel;
    FirstTimer: TTimer;
    shooternr: TLabel;
    digit1_1: TLabel;
    digit2_1: TLabel;
    digit3_1: TLabel;
    dots_1: TLabel;
    buzzerTimer: TTimer;
    seriedown: TPanel;
    serieup: TPanel;
    show_commercial: TTimer;
    hardwaretab: TTabSheet;
    manualgreen: TImage;
    manualorange: TImage;
    manualred: TImage;
    leftscreen: TRadioButton;
    rightscreen: TRadioButton;
    teststringendnr1: TLabel;
    teststringendnr2: TLabel;
    teststringendnr3: TLabel;
    teststringleft: TLabel;
    teststringendnr: TLabel;
    teststringright: TLabel;
    timeperend: TRadioButton;
    timeperturn: TRadioButton;
    totalfinal: TLabel;
    totalfinalend: TLabel;
    turndown: TPanel;
    Turns_per_end: TLabel;
    turnup: TPanel;
    resizeicon: TImage;
    clockicon: TImage;
    closeicon: TImage;
    nexticon: TImage;
    playpauzeicon: TImage;
    stopicon: TImage;
    startupdelay: TTimer;
    Practise: TLabel;
    endtimout: TTimer;
    serielabel: TLabel;
    turnlabel: TLabel;
    USBconnect: TLabel;
    inputtimer: TTimer;
    inputtimernext: TTimer;
    usb: TImage;
    shooteronearrownr: TLabel;
    shooteronearrow: TLabel;
    SOicon: TImage;
    archeryclock: TLabel;  //Label shown when archers get arrows. (over digits)
    copyright: TLabel;
    var2F1sequence: TLabel;
    var2F2sequence: TLabel;
    var2F3sequence: TLabel;
    var2F10sequence: TLabel;
    var2F11sequence: TLabel;
    var2F12sequence: TLabel;
    var2F4sequence: TLabel;
    var2F5sequence: TLabel;
    var2F6sequence: TLabel;
    var2F7sequence: TLabel;
    var2F8sequence: TLabel;
    var2F9sequence: TLabel;
    viewright: TRadioButton;
    websitename: TLabel;
    savesettings: TGroupBox;
    save: TButton;
    arrowlabel: TLabel;
    settings: TImage;
    closeimage2: TImage;
    timeseqpanel: TGroupBox;
    closeimage1: TImage;
    FITA: TRadioButton;
    FITAFIN: TRadioButton;
    onepijl: TRadioButton;
    onearrowpanel: TPanel;
    FitaFinpanel: TPanel;
    FITApanel: TPanel;
    oneone: TRadioButton;
    onetwo: TRadioButton;
    onefour: TRadioButton;
    twotwo: TRadioButton;
    onethree: TRadioButton;
    doubleturnpanel: TPanel;
    doubleturns: TCheckBox;
    so: TGroupBox;
    greentimeso: TSpinEdit;
    secgrnlabel4: TLabel;
    orangetimeso: TSpinEdit;
    secorlabel4: TLabel;
    totaltimeso: TLabel;
    sectotlabel4: TLabel;
    redtimeso: TSpinEdit;
    secredlabel4: TLabel;
    fitatimingbox: TGroupBox;
    secredlabel5: TLabel;
    redtime: TSpinEdit;
    totaltime: TLabel;
    sectotlabel5: TLabel;
    secorlabel5: TLabel;
    orangetime: TSpinEdit;
    greentime: TSpinEdit;
    secgrnlabel5: TLabel;
    seconds: TRadioButton;
    minutes: TRadioButton;
    timing1p: TGroupBox;
    greentime1p: TSpinEdit;
    secgrnlabel1: TLabel;
    orangetime1p: TSpinEdit;
    secorlabel1: TLabel;
    redtime1p: TSpinEdit;
    secredlabel1: TLabel;
    totaltime1p: TLabel;
    sectotlabel1: TLabel;
    nrof1pshooters: TSpinEdit;
    Archerlabel25m1p: TLabel;
    Show: TGroupBox;
    fintarget: TRadioButton;
    finarrow: TRadioButton;
    number: TPanel;
    leftnumber: TSpinEdit;
    rightnumber: TSpinEdit;
    targetID: TLabel;
    greenleft: TImage;
    greyright: TImage;
    greyleft: TImage;
    greenright: TImage;
    finalchoose: TPanel;
    dbltime: TRadioButton;
    dblturn: TRadioButton;
    practiseturns: TSpinEdit;
    practiselabel: TLabel;
    menuremovedelay: TTimer;
    doubleseq: TLabel;
    doubletime: TLabel;
    groupsign: TLabel;
    bannerpicture: TImage;
    dots_2: TLabel;
    digit2_2: TLabel;
    digit3_2: TLabel;
    digit1_2: TLabel;
    leftrightzoom: TTimer;
    secondTimer: TTimer;
    leftstart: TLabel;
    rightstart: TLabel;
    lefttarget: TLabel;
    righttarget: TLabel;
    BCDtoROG2: TCheckBox;
    abcd25m1p: TCheckBox;
    TLredlefton: TImage;
    TLredrighton: TImage;
    TLgrnlefton: TImage;
    TLgrnrighton: TImage;
    TLorangelefton: TImage;
    TLorangerighton: TImage;
    TLredleftoff: TImage;
    TLorangeleftoff: TImage;
    TLgrnleftoff: TImage;
    TLredrightoff: TImage;
    TLorangerightoff: TImage;
    TLgrnrightoff: TImage;
    beforestartbg: TImage;
    beforestarttxt2: TLabel;
    dots_3: TLabel;
    digit2_3: TLabel;
    digit3_3: TLabel;
    digit1_3: TLabel;
    countdowntostart: TLabel;
    SettingsTabs: TPageControl;
    tablang: TTabSheet;
    Lang: TComboBox;
    selectlanguagelabel: TLabel;
    tabscr: TTabSheet;
    minsec: TRadioGroup;
    TLgroup: TGroupBox;
    usetraffic: TCheckBox;
    TLleft: TRadioButton;
    TLright: TRadioButton;
    tabsound: TTabSheet;
    tabscen: TTabSheet;
    startupscenario: TComboBox;
    selectscenariolabel: TLabel;
    hideicons: TCheckBox;
    tabprecnt: TTabSheet;
    starttocd: TButton;
    tostart: TSpinEdit;
    precountminutelabel: TLabel;
    precountcaptionlabel: TLabel;
    showhints: TCheckBox;
    speaker: TCheckBox;
    soundselect: TComboBox;
    testsound: TButton;
    selectsoundlabel: TLabel;
    beforestarttxt1: TLabel;
    menudisap1: TLabel;
    disapsec1: TLabel;
    cdmenu: TLabel;
    preptime: TImage;
    disapsec2: TLabel;
    cdmenu2: TLabel;
    menudisap2: TLabel;
    nexthelp: TLabel;
    chooselabel: TLabel;
    prepsetpanel: TPanel;
    ScenarioScrollBox: TScrollBox;
    F1Group: TGroupBox;
    F1Shoottimelabel: TLabel;
    F1SOtimelabel: TLabel;
    F1SOtime: TLabel;
    F1waitlabel1: TLabel;
    F1waitlabel2: TLabel;
    F1shoottime: TLabel;
    F1SOredtime: TLabel;
    F1sequence: TLabel;
    F1shootredtime: TLabel;
    F1Bevel: TBevel;
    F1description: TLabel;
    F1Button: TButton;
    F2Group: TGroupBox;
    F2Shoottimelabel: TLabel;
    F2SOtimelabel: TLabel;
    F2SOtime: TLabel;
    F2waitlabel1: TLabel;
    F2waitlabel2: TLabel;
    F2shoottime: TLabel;
    F2SOredtime: TLabel;
    F2sequence: TLabel;
    F2shootredtime: TLabel;
    F2Bevel: TBevel;
    F2description: TLabel;
    F2Button: TButton;
    F3Group: TGroupBox;
    F3Shoottimelabel: TLabel;
    F3SOtimelabel: TLabel;
    F3SOtime: TLabel;
    F3waitlabel1: TLabel;
    F3waitlabel2: TLabel;
    F3shoottime: TLabel;
    F3SOredtime: TLabel;
    F3sequence: TLabel;
    F3shootredtime: TLabel;
    F3Bevel: TBevel;
    F3description: TLabel;
    F3Button: TButton;
    F4Group: TGroupBox;
    F4Shoottimelabel: TLabel;
    F4SOtimelabel: TLabel;
    F4SOtime: TLabel;
    F4waitlabel1: TLabel;
    F4waitlabel2: TLabel;
    F4shoottime: TLabel;
    F4SOredtime: TLabel;
    F4sequence: TLabel;
    F4shootredtime: TLabel;
    F4Bevel: TBevel;
    F4description: TLabel;
    F4Button: TButton;
    F5Group: TGroupBox;
    F5Shoottimelabel: TLabel;
    F5SOtimelabel: TLabel;
    F5SOtime: TLabel;
    F5waitlabel1: TLabel;
    F5waitlabel2: TLabel;
    F5shoottime: TLabel;
    F5SOredtime: TLabel;
    F5sequence: TLabel;
    F5shootredtime: TLabel;
    F5Bevel: TBevel;
    F5description: TLabel;
    F5Button: TButton;
    F6Group: TGroupBox;
    F6Shoottimelabel: TLabel;
    F6SOtimelabel: TLabel;
    F6SOtime: TLabel;
    F6waitlabel1: TLabel;
    F6waitlabel2: TLabel;
    F6shoottime: TLabel;
    F6SOredtime: TLabel;
    F6sequence: TLabel;
    F6shootredtime: TLabel;
    F6Bevel: TBevel;
    F6description: TLabel;
    F6Button: TButton;
    F7Group: TGroupBox;
    F7Shoottimelabel: TLabel;
    F7SOtimelabel: TLabel;
    F7SOtime: TLabel;
    F7waitlabel1: TLabel;
    F7waitlabel2: TLabel;
    F7shoottime: TLabel;
    F7SOredtime: TLabel;
    F7sequence: TLabel;
    F7shootredtime: TLabel;
    F7Bevel: TBevel;
    F7description: TLabel;
    F7Button: TButton;
    F8Group: TGroupBox;
    F8Shoottimelabel: TLabel;
    F8SOtimelabel: TLabel;
    F8SOtime: TLabel;
    F8waitlabel1: TLabel;
    F8waitlabel2: TLabel;
    F8shoottime: TLabel;
    F8SOredtime: TLabel;
    F8sequence: TLabel;
    F8shootredtime: TLabel;
    F8Bevel: TBevel;
    F8description: TLabel;
    F8Button: TButton;
    F9Group: TGroupBox;
    F9Shoottimelabel: TLabel;
    F9SOtimelabel: TLabel;
    F9SOtime: TLabel;
    F9waitlabel1: TLabel;
    F9waitlabel2: TLabel;
    F9shoottime: TLabel;
    F9SOredtime: TLabel;
    F9sequence: TLabel;
    F9shootredtime: TLabel;
    F9Bevel: TBevel;
    F9description: TLabel;
    F9Button: TButton;
    F10Group: TGroupBox;
    F10Shoottimelabel: TLabel;
    F10SOtimelabel: TLabel;
    F10SOtime: TLabel;
    F10waitlabel1: TLabel;
    F10waitlabel2: TLabel;
    F10shoottime: TLabel;
    F10SOredtime: TLabel;
    F10sequence: TLabel;
    F10shootredtime: TLabel;
    F10Bevel: TBevel;
    F10description: TLabel;
    F10Button: TButton;
    F11Group: TGroupBox;
    F11Shoottimelabel: TLabel;
    F11SOtimelabel: TLabel;
    F11SOtime: TLabel;
    F11waitlabel1: TLabel;
    F11waitlabel2: TLabel;
    F11shoottime: TLabel;
    F11SOredtime: TLabel;
    F11sequence: TLabel;
    F11shootredtime: TLabel;
    F11Bevel: TBevel;
    F11description: TLabel;
    F11Button: TButton;
    F12Group: TGroupBox;
    F12Shoottimelabel: TLabel;
    F12SOtimelabel: TLabel;
    F12SOtime: TLabel;
    F12waitlabel1: TLabel;
    F12waitlabel2: TLabel;
    F12shoottime: TLabel;
    F12SOredtime: TLabel;
    F12sequence: TLabel;
    F12shootredtime: TLabel;
    F12Bevel: TBevel;
    F12description: TLabel;
    F12Button: TButton;
    varF12Group: TGroupBox;
    varF12Shoottimelabel: TLabel;
    varF12SOtimelabel: TLabel;
    varF12SOtime: TLabel;
    varF12waitlabel1: TLabel;
    varF12waitlabel2: TLabel;
    varF12shoottime: TLabel;
    varF12SOredtime: TLabel;
    varF12sequence: TLabel;
    varF12shootredtime: TLabel;
    varF12Bevel: TBevel;
    varF12description: TLabel;
    varF12Button: TButton;
    savevarF12button: TButton;
    varF11Group: TGroupBox;
    varF11Shoottimelabel: TLabel;
    varF11SOtimelabel: TLabel;
    varF11SOtime: TLabel;
    varF11waitlabel1: TLabel;
    varF11waitlabel2: TLabel;
    varF11shoottime: TLabel;
    varF11SOredtime: TLabel;
    varF11sequence: TLabel;
    varF11shootredtime: TLabel;
    varF11Bevel: TBevel;
    varF11description: TLabel;
    varF11Button: TButton;
    savevarF11button: TButton;
    varF10Group: TGroupBox;
    varF10Shoottimelabel: TLabel;
    varF10SOtimelabel: TLabel;
    varF10SOtime: TLabel;
    varF10waitlabel1: TLabel;
    varF10waitlabel2: TLabel;
    varF10shoottime: TLabel;
    varF10SOredtime: TLabel;
    varF10sequence: TLabel;
    varF10shootredtime: TLabel;
    varF10Bevel: TBevel;
    varF10description: TLabel;
    varF10Button: TButton;
    savevarF10button: TButton;
    varF9Group: TGroupBox;
    varF9Shoottimelabel: TLabel;
    varF9SOtimelabel: TLabel;
    varF9SOtime: TLabel;
    varF9waitlabel1: TLabel;
    varF9waitlabel2: TLabel;
    varF9shoottime: TLabel;
    varF9SOredtime: TLabel;
    varF9sequence: TLabel;
    varF9shootredtime: TLabel;
    varF9Bevel: TBevel;
    varF9description: TLabel;
    varF9Button: TButton;
    savevarF9button: TButton;
    varF8Group: TGroupBox;
    varF8Shoottimelabel: TLabel;
    varF8SOtimelabel: TLabel;
    varF8SOtime: TLabel;
    varF8waitlabel1: TLabel;
    varF8waitlabel2: TLabel;
    varF8shoottime: TLabel;
    varF8SOredtime: TLabel;
    varF8sequence: TLabel;
    varF8shootredtime: TLabel;
    varF8Bevel: TBevel;
    varF8description: TLabel;
    varF8Button: TButton;
    savevarF8button: TButton;
    varF7Group: TGroupBox;
    varF7Shoottimelabel: TLabel;
    varF7SOtimelabel: TLabel;
    varF7SOtime: TLabel;
    varF7waitlabel1: TLabel;
    varF7waitlabel2: TLabel;
    varF7shoottime: TLabel;
    varF7SOredtime: TLabel;
    varF7sequence: TLabel;
    varF7shootredtime: TLabel;
    varF7Bevel: TBevel;
    varF7description: TLabel;
    varF7Button: TButton;
    savevarF7button: TButton;
    varF6Group: TGroupBox;
    varF6Shoottimelabel: TLabel;
    varF6SOtimelabel: TLabel;
    varF6SOtime: TLabel;
    varF6waitlabel1: TLabel;
    varF6waitlabel2: TLabel;
    varF6shoottime: TLabel;
    varF6SOredtime: TLabel;
    varF6sequence: TLabel;
    varF6shootredtime: TLabel;
    varF6Bevel: TBevel;
    varF6description: TLabel;
    varF6Button: TButton;
    savevarF6button: TButton;
    varF5Group: TGroupBox;
    varF5Shoottimelabel: TLabel;
    varF5SOtimelabel: TLabel;
    varF5SOtime: TLabel;
    varF5waitlabel1: TLabel;
    varF5waitlabel2: TLabel;
    varF5shoottime: TLabel;
    varF5SOredtime: TLabel;
    varF5sequence: TLabel;
    varF5shootredtime: TLabel;
    varF5Bevel: TBevel;
    varF5description: TLabel;
    varF5Button: TButton;
    savevarF5button: TButton;
    varF4Group: TGroupBox;
    varF4Shoottimelabel: TLabel;
    varF4SOtimelabel: TLabel;
    varF4SOtime: TLabel;
    varF4waitlabel1: TLabel;
    varF4waitlabel2: TLabel;
    varF4shoottime: TLabel;
    varF4SOredtime: TLabel;
    varF4sequence: TLabel;
    varF4shootredtime: TLabel;
    varF4Bevel: TBevel;
    varF4description: TLabel;
    varF4Button: TButton;
    savevarF4button: TButton;
    varF3Group: TGroupBox;
    varF3Shoottimelabel: TLabel;
    varF3SOtimelabel: TLabel;
    varF3SOtime: TLabel;
    varF3waitlabel1: TLabel;
    varF3waitlabel2: TLabel;
    varF3shoottime: TLabel;
    varF3SOredtime: TLabel;
    varF3sequence: TLabel;
    varF3shootredtime: TLabel;
    varF3Bevel: TBevel;
    varF3description: TLabel;
    varF3Button: TButton;
    savevarF3button: TButton;
    varF2Group: TGroupBox;
    varF2Shoottimelabel: TLabel;
    varF2SOtimelabel: TLabel;
    varF2SOtime: TLabel;
    varF2waitlabel1: TLabel;
    varF2waitlabel2: TLabel;
    varF2shoottime: TLabel;
    varF2SOredtime: TLabel;
    varF2sequence: TLabel;
    varF2shootredtime: TLabel;
    varF2Bevel: TBevel;
    varF2description: TLabel;
    varF2Button: TButton;
    savevarF2button: TButton;
    varF1Group: TGroupBox;
    varF1Shoottimelabel: TLabel;
    varF1SOtimelabel: TLabel;
    varSOtimelabel:TLabel;
    varF1SOtime: TLabel;
    varF1waitlabel1: TLabel;
    varF1waitlabel2: TLabel;
    varF1shoottime: TLabel;
    varF1SOredtime: TLabel;
    varF1sequence: TLabel;
    varF1shootredtime: TLabel;
    varF1Bevel: TBevel;
    varF1description: TLabel;
    varF1Button: TButton;
    savevarF1button: TButton;
    switchmomoff: TTimer;
    procedure ABCDperENDChange(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure buzzicon1Click(Sender: TObject);
    procedure buzzicon2Click(Sender: TObject);
    procedure buzzicon3Click(Sender: TObject);
    procedure dangerClick(Sender: TObject);
    procedure finalstimingClick(Sender: TObject);
    procedure fi(Sender: TObject);
    procedure FITAFINlabelClick(Sender: TObject);
    procedure followChange(Sender: TObject);
    procedure followtimerTimer(Sender: TObject);
    procedure fromHOSTChange(Sender: TObject);
    procedure hideiconsChange(Sender: TObject);
    procedure LANinputChange(Sender: TObject);
    procedure LANselectChange(Sender: TObject);
    procedure leftscreenChange(Sender: TObject);
    procedure LUDP1Error(const msg: string; aSocket: TLSocket);
    procedure LUDP1Receive(aSocket: TLSocket);
    procedure networktimestampTimer(Sender: TObject);
    procedure nrof1ppractisearrowsChange(Sender: TObject);
    procedure onefiveClick(Sender: TObject);
    procedure onesixClick(Sender: TObject);
    procedure portnumber1Change(Sender: TObject);
    procedure portnumberfollowChange(Sender: TObject);
    procedure portnumberrecChange(Sender: TObject);
    procedure rotate25m1pChange(Sender: TObject);
    procedure selectport1Change(Sender: TObject);
    procedure serialtimestampTimer(Sender: TObject);
    procedure Shooter5Click(Sender: TObject);
    procedure Shooter6Click(Sender: TObject);
    procedure TCP1Accept(aSocket: TLSocket);
    procedure TCP1Receive(aSocket: TLSocket);
    procedure TCPfollowAccept(aSocket: TLSocket);
    procedure TCPfollowReceive(aSocket: TLSocket);
    procedure threetwoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure topbotClick(Sender: TObject);
    procedure twothreeChange(Sender: TObject);
    procedure twothreeClick(Sender: TObject);
    procedure twotwoChange(Sender: TObject);
    procedure UDP1Error(const msg: string; aSocket: TLSocket);
    procedure manualgreenClick(Sender: TObject);
    procedure manualorangeClick(Sender: TObject);
    procedure manualredClick(Sender: TObject);
    procedure rightscreenChange(Sender: TObject);
    procedure showtargetChange(Sender: TObject);
    procedure showtargetClick(Sender: TObject);
    procedure soundsignallabel1Click(Sender: TObject);
    procedure followClick(Sender: TObject);
    procedure ManualClick(Sender: TObject);
    procedure manualpannelClick(Sender: TObject);
    procedure serialRxData(Sender: TObject);
    procedure arduinoselect1Change(Sender: TObject);
    procedure connect_delayTimer(Sender: TObject);
    procedure connect_switch_delayTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);

    procedure K8055selectChange(Sender: TObject);
    procedure FirstTimerTimer(Sender: TObject);

    procedure playpausebuttonClick(Sender: TObject);
    procedure orangetimeChange(Sender: TObject);
    procedure initialize;//to initialize the system at startup
    procedure resizewindow;
    procedure resizewindowfinals;
    procedure resizewindownonfinals;
    procedure resizewindowall;
    procedure serialport1Change(Sender: TObject);
    procedure getPCname;
    procedure connectports;
    procedure show_commercialTimer(Sender: TObject);
    procedure TLgrnleftoffClick(Sender: TObject);
    procedure TLgrnleftonClick(Sender: TObject);
    procedure TLgrnrightoffClick(Sender: TObject);
    procedure TLgrnrightonClick(Sender: TObject);
    procedure TLorangeleftoffClick(Sender: TObject);
    procedure TLorangeleftonClick(Sender: TObject);
    procedure TLorangerightoffClick(Sender: TObject);
    procedure TLorangerightonClick(Sender: TObject);
    procedure TLredleftoffClick(Sender: TObject);
    procedure TLredleftonClick(Sender: TObject);
    procedure TLredrightoffClick(Sender: TObject);
    procedure TLredrightonClick(Sender: TObject);
    procedure Turns_per_endClick(Sender: TObject);
    procedure UDP1Receive(aSocket: TLSocket);
    procedure UDPfollowReceive(aSocket: TLSocket);
    procedure varF1BevelChangeBounds(Sender: TObject);
    procedure viewleftClick(Sender: TObject);
    procedure viewrightChange(Sender: TObject);
    procedure viewrightClick(Sender: TObject);
    procedure views;
    procedure windowsize;
    procedure next;
    procedure stop;
    procedure stopemergency;
    procedure hide;
    procedure hide2;
    procedure playpauze;
    procedure soff;
    procedure upserie;
    procedure downserie;
    procedure upturn;
    procedure downturn;
    Procedure switchbox;
    Procedure TLswitch;
    Procedure setlanguage;
    Procedure changescenario;
    procedure connect;
    Procedure Setsettings;
    Procedure storeF;
    procedure initsystemtype; //after selecting system type (Fita, 25m1p, etc) subsettings will be set according to this system type

    Procedure showF1;
    Procedure showF2;
    Procedure showF3;
    Procedure showF4;
    Procedure showF5;
    Procedure showF6;
    Procedure showF7;
    Procedure showF8;
    Procedure showF9;
    Procedure showF10;
    Procedure showF11;
    Procedure showF12;
    Procedure getsetting;
    Procedure getscenario;
    Procedure oneonesystem;
    Procedure onetwosystem;
    Procedure onethreesystem;
    procedure onefoursystem;
    Procedure twotwosystem;
    Procedure onefivesystem;
    Procedure onesixsystem;
    Procedure twothreesystem;
    Procedure threetwosystem;
    Procedure topbotsystem;
    Procedure showseq;
    Procedure showtime;
    Procedure checknextsecond;
    Procedure selectleftarcher;
    Procedure selectrightarcher;
    Procedure selectnonearcher;
    procedure finalyzeturn;
    procedure nextfinal;
    procedure Changestartarcher;
    procedure starttostart;
    procedure removemenu;
    procedure updatemenu;
    procedure soundsignal;
    Procedure setvarsettings;
    Procedure setgreen;
    Procedure setorange;
    Procedure setred;
    Procedure onebeep;
    Procedure twobeeps;
    Procedure threebeeps;
    //Procedure serialreceive;
    Procedure switchfollow;
    Procedure Followlansettings;
    Procedure refreshserial;
    procedure FormActivate(Sender: TObject);
    procedure timingsettingsClick(Sender: TObject);
    procedure serienrClick(Sender: TObject);
    procedure greentimeChange(Sender: TObject);
    procedure oneoneClick(Sender: TObject);
    procedure onetwoClick(Sender: TObject);
    procedure onethreeClick(Sender: TObject);
    procedure onefourClick(Sender: TObject);
    procedure twotwoClick(Sender: TObject);
    procedure decreaseseriebuttonClick(Sender: TObject);
    procedure increaseseriebuttonClick(Sender: TObject);
    procedure decreaseshooterbuttonClick(Sender: TObject);
    procedure increaseshooterbuttonClick(Sender: TObject);
    procedure minutesClick(Sender: TObject);
    procedure secondsClick(Sender: TObject);
    procedure startnextbuttonClick(Sender: TObject);
    procedure buzzerTimerTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure stopbuttonClick(Sender: TObject);
    procedure startupdelayTimer(Sender: TObject);
    procedure closeiconClick(Sender: TObject);
    procedure endtimoutTimer(Sender: TObject);
    procedure dots_1Click(Sender: TObject);
    procedure digit2_1Click(Sender: TObject);
    procedure digit1_1Click(Sender: TObject);
    procedure USBconnectClick(Sender: TObject);
    procedure inputtimerTimer(Sender: TObject);
    procedure inputtimernextTimer(Sender: TObject);
    procedure usbClick(Sender: TObject);
    procedure Shooter2Click(Sender: TObject);
    procedure Shooter4Click(Sender: TObject);
    procedure Shooter3Click(Sender: TObject);
    procedure Shooter1Click(Sender: TObject);
    procedure greentimesoChange(Sender: TObject);
    procedure orangetimesoChange(Sender: TObject);
    procedure greentime1pChange(Sender: TObject);
    procedure orangetime1pChange(Sender: TObject);
    procedure nrof1pshootersChange(Sender: TObject);
    procedure SOiconClick(Sender: TObject);
    procedure shooteronearrownrClick(Sender: TObject);
    procedure shooteronearrowClick(Sender: TObject);
    procedure doubleturnsClick(Sender: TObject);
    procedure resizeiconClick(Sender: TObject);
    procedure websitenameClick(Sender: TObject);
    procedure archeryclockClick(Sender: TObject);
    procedure minsecClick(Sender: TObject);
    procedure saveClick(Sender: TObject);
    procedure LangChange(Sender: TObject);
    procedure settingsClick(Sender: TObject);
    procedure closeimage2Click(Sender: TObject);
    procedure hideiconsClick(Sender: TObject);
    procedure F1ButtonClick(Sender: TObject);
    procedure F2ButtonClick(Sender: TObject);
    procedure F3ButtonClick(Sender: TObject);
    procedure F4ButtonClick(Sender: TObject);
    procedure F5ButtonClick(Sender: TObject);
    procedure F6ButtonClick(Sender: TObject);
    procedure F7ButtonClick(Sender: TObject);
    procedure F8ButtonClick(Sender: TObject);
    procedure F9ButtonClick(Sender: TObject);
    procedure F10ButtonClick(Sender: TObject);
    procedure F11ButtonClick(Sender: TObject);
    procedure F12ButtonClick(Sender: TObject);
    procedure practiseturnsChange(Sender: TObject);
    procedure startupscenarioChange(Sender: TObject);

    procedure FITAClick(Sender: TObject);
    procedure FITAFINClick(Sender: TObject);
    procedure onepijlClick(Sender: TObject);
    procedure closeimage1Click(Sender: TObject);
    procedure redtimeChange(Sender: TObject);
    procedure redtimesoChange(Sender: TObject);
    procedure redtime1pChange(Sender: TObject);
    procedure finnameClick(Sender: TObject);
    procedure finarrowClick(Sender: TObject);
    procedure fintargetClick(Sender: TObject);
    procedure numberClick(Sender: TObject);
    procedure dblturnClick(Sender: TObject);
    procedure dbltimeClick(Sender: TObject);
    procedure menuremovedelayTimer(Sender: TObject);

    procedure greyleftClick(Sender: TObject);
    procedure greyrightClick(Sender: TObject);
    procedure finalchooseClick(Sender: TObject);
    procedure leftrightzoomTimer(Sender: TObject);
    procedure secondTimerTimer(Sender: TObject);
    procedure timeperendClick(Sender: TObject);
    procedure timeperturnClick(Sender: TObject);
    procedure greenfinalChange(Sender: TObject);
    procedure orangefinalChange(Sender: TObject);
    procedure greenfinalendChange(Sender: TObject);
    procedure orangefinalendChange(Sender: TObject);
    procedure digit3_2Click(Sender: TObject);
    procedure digit2_2Click(Sender: TObject);
    procedure dots_2Click(Sender: TObject);
    procedure digit1_2Click(Sender: TObject);
    procedure digit3_1Click(Sender: TObject);
    procedure rightstartClick(Sender: TObject);
    procedure leftstartClick(Sender: TObject);
    procedure finalturnsChange(Sender: TObject);
    procedure leftnumberChange(Sender: TObject);
    procedure rightnumberChange(Sender: TObject);
    procedure BCDtoROG2Click(Sender: TObject);
    procedure savevarF8buttonClick(Sender: TObject);
    procedure savevarF1buttonClick(Sender: TObject);
    procedure savevarF2buttonClick(Sender: TObject);
    procedure savevarF3buttonClick(Sender: TObject);
    procedure savevarF4buttonClick(Sender: TObject);
    procedure savevarF5buttonClick(Sender: TObject);
    procedure savevarF6buttonClick(Sender: TObject);
    procedure savevarF7buttonClick(Sender: TObject);
    procedure savevarF9buttonClick(Sender: TObject);
    procedure savevarF10buttonClick(Sender: TObject);
    procedure savevarF11buttonClick(Sender: TObject);
    procedure savevarF12buttonClick(Sender: TObject);
    procedure varF1ButtonClick(Sender: TObject);
    procedure varF2ButtonClick(Sender: TObject);
    procedure varF3ButtonClick(Sender: TObject);
    procedure varF4ButtonClick(Sender: TObject);
    procedure varF5ButtonClick(Sender: TObject);
    procedure varF6ButtonClick(Sender: TObject);
    procedure varF7ButtonClick(Sender: TObject);
    procedure varF8ButtonClick(Sender: TObject);
    procedure varF9ButtonClick(Sender: TObject);
    procedure varF10ButtonClick(Sender: TObject);
    procedure varF11ButtonClick(Sender: TObject);
    procedure varF12ButtonClick(Sender: TObject);
    procedure redfinalChange(Sender: TObject);
    procedure redfinalendChange(Sender: TObject);
    procedure abcd25m1pClick(Sender: TObject);
    procedure TLleftClick(Sender: TObject);
    procedure TLrightClick(Sender: TObject);
    procedure usetrafficClick(Sender: TObject);
    procedure soundselectChange(Sender: TObject);
    procedure testsoundClick(Sender: TObject);
    procedure starttocdClick(Sender: TObject);
    procedure countdowntostartClick(Sender: TObject);
    procedure tostartChange(Sender: TObject);
    procedure speakerClick(Sender: TObject);
    procedure showhintsClick(Sender: TObject);
    procedure tabscenShow(Sender: TObject);
    procedure tabscenHide(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  //sernew: TBlockSerial;
  DisableOtherFunctionCall:boolean;
  Countdownform: TCountdownform;
  Filespath:string;  //location of files
  labelnr:integer;  //depending on the number a different text is shown during wat time
  aspectratio:real; //aspect ratio. Depending on TL on screen or not
  nrofSOarrows:integer;  //aantal naschiet / shootoffpijlen
  Shooters:integer;      //shooters per end
  showABCD:boolean; //To indicate or ABCD is visible or top bottom
  oldshooters:integer;  // detect shooters change
  oldsound:string;  //detect soundstart.
  Fitasystem:integer;  //0=1pijl 1is 3pijl 2 is fitafinals
  Shootoff:double; //actief in geval een shootoff plaatsvind
  mag:real; //depending on OS a different size for all items is needed.
  Turnsperserie:integer;    //number of turns per serie
  Archersperturn:integer;    //number of archers per turn per target
  oldArchersperturn:integer;    //to detect an archersperturn change
  archerspertarget:integer;   //number of archers per target
  serienumber:integer;      //current end
  shooternumber:double; //current shooter;
  turnnumber:integer;            //current turn
  shootercolor:tcolor;   //color of the letter for shooters in this turn
  nonshootercolor:tcolor;  //color of the letter for shooters not in this turn
  waitcolor:tcolor; //digit color during waitng time
  redcolor:tcolor; //digit color during red
  orangecolor:tcolor; //digit color during orange
  greencolor:tcolor; //digit color during green
  countdowntimer:integer; //actual value to count down in seconds
  countdowntimer2:integer; //actual value to count down in seconds for second timer in case of finalrounds
  countdowntimertmp:integer; //tmp value for switching between coundowntimer2 and countdowntimer
  temptime:integer; //time for debugging
  state:integer; //possible states are 1 waitstateredstate 2 greenstate 3 orangestate and 4 redstate  and 5 countdown to start match. 6 is emergency
  oldstate:integer; //to detect a state change
  alarmstate:integer; //0 is allarmtate is off. 1 is allarmstate is on
  buzzeron:integer; //buzzer aan of uit;
  senton:integer; //serial sent (TE)  aan of uit;
  leftsent:integer; //serial sent 1 =left side, 0 = right side
  ABCDsent:integer; //serial sent 1 = no ABCD, 0=ABCD
  scenario:string;  //Scenario (F1 to F12). used in a loop to get scenarios during initialyse
  buzzeronold:integer; //old value to check if serial update is needed
  mode:integer; //mode to read/write/set scenario
  lamp_green_on_off:integer; //green lamp off or on;
  lamp_orange_on_off:integer; //orange lamp off or on;
  lamp_red_on_off:integer; //red lamp off or on;
  LampA_on_off:integer; //A lamp off or on;
  LampB_on_off:integer; //B lamp off or on;
  LampC_on_off:integer; //C lamp off or on;
  LampD_on_off:integer; //D lamp off or on;
  LampE_on_off:integer; //E lamp off or on;
  LampF_on_off:integer; //F lamp off or on;
  Not_LampA_on_off:integer; //A lamp off but used;
  Not_LampB_on_off:integer; //B lamp off but used;
  Not_LampC_on_off:integer; //C lamp off but used;
  Not_LampD_on_off:integer; //D lamp off but used;
  Not_LampE_on_off:integer; //E lamp off but used;
  Not_LampF_on_off:integer; //F lamp off but used;
  rememberK8055i,rememberK8055E,rememberK8055F:longint;

  lamp_green_left_on_off:integer; //groenelamp aan of uit in finale;
  lamp_orange_left_on_off:integer; //oranje lamp aan of uit in finale;
  lamp_red_left_on_off:integer; //rode lamp aan of uit in finale;
  lamp_green_right_on_off:integer; //groenelamp aan of uit in finale;
  lamp_orange_right_on_off:integer; //oranje lamp aan of uit in finale;
  lamp_red_right_on_off:integer; //rode lamp aan of uit in finale;
  leftalign:integer; //  to remember the left position of the form when changing to small form
  topalign:integer;   // to remember the top position of the form when changing to small form
  Practiseturn:integer;   // to remember if practiceturn is active or normal turn
  nrofbeeps:integer; //number of times for buzzer
  nrofmanualbeeps:integer; //number of beeps in manual mode
  nrofturns:integer; //if there are more than 1 turn before getting the arrow (for example during long distances 2 times 3 arrows.
  serialsequence:integer; //serial sequence for serial output (TL left, TL right, ABCD etc
  times:integer; //   if nr of turns is 2 with double times: 2 else 1
  turnsss:integer; //   if nr of turns is 2 with double turns: 2 else 1
  nextsec:integer; // is 1 if next second can start.
  systemtime:TDateTime; //time according to the PC
  referencetime:TDateTime; //systemtime during next push
  referencesize:integer; //for resizing. depending on aspect ratio choose height or with as reference.
  iconsize:integer; // for resizing, icons depending on referencesize but with a maximum size;
  leftmarge:integer;  //left marge is bigger than 0 in case of widescreens
  topmarge:integer;   //top marge is bigger than 0 in case of smallscreens
  bannerAR:extended; // Aspect ratio is depending on the immage (width/height)
  bannerscaling:integer; // is depending on the size of the picture. reference is height of 100
  CardAddr:longint;      //adress  of k8055 card
  oldoutpstate:longint; //Remember previous output stat to know if a latch is needed
  nobannerfile:string;  //yes if there is a banner.bmp file available
  dutchlang:string;     //yes means initial version has dutch language
  frenchlang:string;    //yes means initial version has french language
  englang:string;       //yes means initial version has English language
  WavFilename:PChar;   //Filename of the wav file used as sound.
  wavbuffer:string;
  settingsfile : TextFile;   //to read/wite settings file
  scenariotextfile : TextFile;    //to read scenariofles
  storefile : TextFile;           //to store scenariofiles
  langTxtFile : TextFile;    //to read/write language textfile
  buffer : string;   //to read/write items from files
  buffer2 : string;  //to read/write items from files
  langbuffer : string;  //to read items from language files
  precnthintfirst : string; //to read the hint of the counter during time before shoot from initialisation file
  Mintext : string;       //to read the hint of minutes from initialisation file
  Sectext : string;       //to read the hint of seconds from initialisation file
  Minabr : string;        //to read the hint of minutes abreviation from initialisation file
  Menudisap : string;     //to read the hint of mune disapears from initialisation file
  Paustxt : string;         //hint text pause
  resumetxt : string;       //hint text resume
  NXTstart : string;        //hint text start timer
  NXTnext : string;         //hint text next archer
  NXTstop : string;         //hint text last archer
  ActAtxt : string;         //hint text actuate archer A
  ActBtxt : string;         //hint text actuate archer B
  ActCtxt : string;         //hint text actuate archer C
  ActDtxt : string;         //hint text actuate archer D
  ActEtxt : string;         //hint text actuate archer E
  ActFtxt : string;         //hint text actuate archer F
  Mainhint1 : string;       //main hint text 1
  Mainhint2 : string;       //main hint text 2
  Mainhint3 : string;       //main hint text 3
  Mainhint4 : string;       //main hint text 4
  selectright : string;     //selectrightsidehint
  selectleft : string;      //select leftsidehint
  prevarch: string;         //select previousarcherhint
  nextarch: string;         //select nextarcherhint
  Connectingstring:string;  //language text for connecting
  Connectedstring:string;  //language text for connected
  Cardnotfoundstring:string;  //language text for Card not found
  Cardstring:string;  //language text for Card
  waitstate:integer; //remember in follow state if digits indicated waitstate (state1)
  leftreceivedvalue:string; //remember in follow mode the left value
  rightreceivedvalue:string; //remember in follow mode the right value
  trafficreceiveddata:string; //remember in follow mode the traficlight value
  fitamode:integer;         //fita mode (1=A, 2=A-B, 3=A-B-C, 4=A-B-C-D, 5=AB-CD)
  Fstore:string; //location for defaultsetting
  fitaseq:string; //sequence A, A-B, A-B-C, etc
  fitaseq2:string; //sequence of second end. A, B-A, C-A-B, etc
  duration:string; //Duration of 1 turn,
  archerysystem:string; // Can be 'FITA',  'FITAFIN', '25m1P' , 'manual' or 'follow'
  followsystem:string; //  0 = fita in top bottom mode, 1='fita',2 ='fitafin,3='25m1p',4='manual'
  followleft, followright:boolean; // to indicate in follow finals if left or right archer is active
  oldfollowsystem: string; //to detect a followsystemchange.
  fitafinarcher:string; //Which archers turn in finals . Can be 'left', 'right' or 'none'
  fitafinstartarcher:string; //Which archers start the serie in finals . Can be 'left', 'right' or 'none'
  leftscale:integer; //(scaling of left figure
  rightscale:integer; //(scaling of right figure
  menuremovesec:integer; //secons before menu disapears
  arduinowrite1:longint; //remember the last serial data to arduino for trafic lights and ABCD light. new information is only sent if it is different
  arduinowrite2:longint; //remember the last serial data to arduino for left side digits. new information is only sent if it is different
  arduinowrite3:longint; //remember the last serial data to arduino for right side digits. new information is only sent if it is different
  arduinowrite4:longint; //remember the last serial data to arduino for abcd details. new information is only sent if it is different
  arduinowrite5:longint; //remember the last serial data to arduino for end nr  new information is only sent if it is different
  arduinowrite6:longint;
  arduinowrite7:longint;
  SENTLAN1, SENTLAN2, SENTLAN3, SENTLAN4, SENTLAN4b, SENTLAN5, SENTLAN6:longint; //serialdata to sent via LAN
  justconnected:boolean; //when the arduino is just connected, a serial update is needed to arduino (even if previous sent signal is not different
  serref1, serref2, serref3, serref4, serref5, serref6, serref7 : boolean; //to indicate if the individual serial strings need to be refreshed.
  refreshtiming:integer;   //counter for refreshing serial signal
  arduinoactive_at_init: boolean;
  manualfollowmenuremove:boolean; //to indicate tha timer is running to remove menu in follow or manual mode
  initializationstate:boolean;
  NETWORK1: TLConnection; //network1 (first port  )
  foltime1, foltime2, foltrafic, folsecdetails, folsecdetailssec, folendnr, folstate:string;  // 16 bits values for follow mode

  oldfolstate, oldfolsecdetails, oldfolsecdetailssec, oldfolendnr:string; //To detect changes in folsecdetails or folstate or folendnr
  serint:integer; // to indicate which serial string needs to be sent
  {$IFDEF Unix}
  //SDL Stuff
  audio_rate: integer;
  audio_format: Uint16;
  audio_channels: integer;
  audio_buffers : integer;
  wave: PMix_Chunk;
  channel : integer;
  {$ENDIF}


implementation

{$R *.lfm}
{$IFDEF Windows}       //at this moment only supported for Windows
function OpenDevice(CardAddress: Longint): Longint; stdcall; external 'K8055D.dll';
procedure CloseDevice; stdcall; external 'K8055D.dll';
function ReadAnalogChannel(Channel: Longint):Longint; stdcall; external 'K8055D.dll';
procedure ReadAllAnalog(var Data1, Data2: Longint); stdcall; external 'K8055D.dll';
procedure OutputAnalogChannel(Channel: Longint; Data: Longint); stdcall; external 'K8055D.dll';
procedure OutputAllAnalog(Data1: Longint; Data2: Longint); stdcall; external 'K8055D.dll';
procedure ClearAnalogChannel(Channel: Longint); stdcall; external 'K8055D.dll';
procedure ClearAllAnalog; stdcall; external 'K8055D.dll';
procedure SetAnalogChannel(Channel: Longint); stdcall; external 'K8055D.dll';
procedure SetAllAnalog; stdcall; external 'K8055D.dll';
procedure WriteAllDigital(Data: Longint);stdcall;  external 'K8055D.dll';
procedure ClearDigitalChannel(Channel: Longint); stdcall; external 'K8055D.dll';
procedure ClearAllDigital; stdcall; external 'K8055D.dll';
procedure SetDigitalChannel(Channel: Longint); stdcall; external 'K8055D.dll';
procedure SetAllDigital; stdcall; external 'K8055D.dll';
function ReadDigitalChannel(Channel: Longint): Boolean; stdcall; external 'K8055D.dll';
function ReadAllDigital: Longint; stdcall; external 'K8055D.dll';
function ReadCounter(CounterNr: Longint): Longint; stdcall; external 'K8055D.dll';
procedure ResetCounter(CounterNr: Longint); stdcall; external 'K8055D.dll';
procedure SetCounterDebounceTime(CounterNr, DebounceTime:Longint); stdcall; external 'K8055D.dll';

{$ENDIF}

{$IFDEF Unix}

{$ENDIF}

Function bitstoABCD (BIT1,BIT2,BIT3:string):string;
var tot:integer;

begin
  tot:=0;
  if BIT3='1'then tot:=tot+1;
  if BIT2='1'then tot:=tot+2;
  if BIT1='1'then tot:=tot+4;


  case tot of

  1: bitstoABCD:='A';
  2: bitstoABCD:='B';
  3: bitstoABCD:='C';
  4: bitstoABCD:='D';
  5: bitstoABCD:='E';
  6: bitstoABCD:='F';

  else bitstoABCD:='';

  end;

end;

procedure TCountdownform.TLswitch;

//This procedure takes care for the trafic lights on the screen. depending on:
//-if the trafic lights are enabled
//-if the trafic lights are selected for right or left side of the screen
//-if one (normal) or two (final rounds) trafic lights are needed
begin
  if (usetraffic.checked=true)or (archerysystem='manual') or ((archerysystem='follow') and (followsystem='4'))then
  begin   //Show trafic lights on screen
    if  ((archerysystem<>'fitafin') or ((archerysystem='fitafin')and (finarrow.Checked=false))) then

    begin                        //others than final rounds where only one trafic light is used
      if TLleft.checked=true then
      begin               //Trafic lights on left side of the screen
        TLredrightoff.Visible:=false;       //Left side, so right side invisible
        TLorangerightoff.Visible:=false;    //Left side, so right side invisible
        TLgrnrightoff.Visible:=false;       //Left side, so right side invisible
        TLredrighton.Visible:=false;        //Left side, so right side invisible
        TLorangerighton.Visible:=false;     //Left side, so right side invisible
        TLgrnrighton.Visible:=false;        //Left side, so right side invisible
        if (archerysystem<>'fitafin') or ((archerysystem='fitafin')and (viewleft.Checked=true) ) then
        begin
          if lamp_red_left_on_off=1 then
          begin                               //red state
            TLredleftoff.Visible:=false;      //--> 'red light off' invisible
            TLredlefton.Visible:=true;        //--> 'red light visible
          end
          else
          begin                               // not a red state
            TLredleftoff.Visible:=true;       //--> 'red light off' visible
            TLredlefton.Visible:=false;       //--> 'red light invisible
          end;
          if lamp_orange_left_on_off=1 then
          begin                               //orange state
            TLorangeleftoff.Visible:=false;   //--> 'orange light off' invisible
            TLorangelefton.Visible:=true;     //--> 'orange light visible
          end
          else
          begin                               //not orange state
            TLorangeleftoff.Visible:=true;    //--> 'orange light off' visible
            TLorangelefton.Visible:=false;    //--> 'orange light invisible
          end;
          if lamp_green_left_on_off=1 then
          begin                               //green state
            TLgrnleftoff.Visible:=false;      //--> 'green light off' invisible
            TLgrnlefton.Visible:=true;        //--> 'green light visible
          end
          else
          begin                               //not green state
            TLgrnleftoff.Visible:=true;       //--> 'green light off' visible
            TLgrnlefton.Visible:=false;       //--> 'green light invisible
          end;
        end
        else    //fita final mode, but right screen is selected so right side traficlight collors are leading to show on screen.
        begin
          if lamp_red_right_on_off=1 then
           begin                               //red state
             TLredleftoff.Visible:=false;      //--> 'red light off' invisible
             TLredlefton.Visible:=true;        //--> 'red light visible
           end
           else
           begin                               // not a red state
             TLredleftoff.Visible:=true;       //--> 'red light off' visible
             TLredlefton.Visible:=false;       //--> 'red light invisible
           end;
           if lamp_orange_right_on_off=1 then
           begin                               //orange state
             TLorangeleftoff.Visible:=false;   //--> 'orange light off' invisible
             TLorangelefton.Visible:=true;     //--> 'orange light visible
           end
           else
           begin                               //not orange state
             TLorangeleftoff.Visible:=true;    //--> 'orange light off' visible
             TLorangelefton.Visible:=false;    //--> 'orange light invisible
           end;
           if lamp_green_right_on_off=1 then
           begin                               //green state
             TLgrnleftoff.Visible:=false;      //--> 'green light off' invisible
             TLgrnlefton.Visible:=true;        //--> 'green light visible
           end
           else
           begin                               //not green state
             TLgrnleftoff.Visible:=true;       //--> 'green light off' visible
             TLgrnlefton.Visible:=false;       //--> 'green light invisible
           end;


        end;
      end
      else
      begin   //Trafic lights on right side of the screen
        TLredleftoff.Visible:=false;        //right side, so left side invisible
        TLorangeleftoff.Visible:=false;     //right side, so left side invisible
        TLgrnleftoff.Visible:=false;        //right side, so left side invisible
        TLredlefton.Visible:=false;         //right side, so left side invisible
        TLorangelefton.Visible:=false;      //right side, so left side invisible
        TLgrnlefton.Visible:=false;         //right side, so left side invisible
        if (archerysystem<>'fitafin') or ((archerysystem='fitafin')and (viewright.Checked=true) ) then
        begin
          if lamp_red_right_on_off=1 then
          begin                               //red state
            TLredrightoff.Visible:=false;     //--> 'red light off' invisible
            TLredrighton.Visible:=true;       //--> red light visible
          end
          else
          begin                               // not a red state
            TLredrightoff.Visible:=true;      //--> 'red light off' visible
            TLredrighton.Visible:=false;      //--> red light invisible
          end;
          if lamp_orange_right_on_off=1 then
          begin                               //orange state
            TLorangerightoff.Visible:=false;  //--> 'orange light off' invisible
            TLorangerighton.Visible:=true;    //--> orange light visible
          end
          else
          begin                               //not orange state
            TLorangerightoff.Visible:=true;   //--> 'orange light off' visible
            TLorangerighton.Visible:=false;   //--> orange light invisible
          end;
          if lamp_green_right_on_off=1 then
          begin                               //green state
            TLgrnrightoff.Visible:=false;     //--> 'green light off' invisible
            TLgrnrighton.Visible:=true;       //--> green light visible
          end
          else
          begin                               //not green state
            TLgrnrightoff.Visible:=true;      //--> 'green light off' visible
            TLgrnrighton.Visible:=false;      //--> green light invisible
          end;
        end
        else    //fita final mode, but left screen is selected so left side traficlight colors are leading to show on screen.
        begin
          if lamp_red_left_on_off=1 then
          begin                               //red state
            TLredrightoff.Visible:=false;     //--> 'red light off' invisible
            TLredrighton.Visible:=true;       //--> red light visible
          end
          else
          begin                               // not a red state
            TLredrightoff.Visible:=true;      //--> 'red light off' visible
            TLredrighton.Visible:=false;      //--> red light invisible
          end;
          if lamp_orange_left_on_off=1 then
          begin                               //orange state
            TLorangerightoff.Visible:=false;  //--> 'orange light off' invisible
            TLorangerighton.Visible:=true;    //--> orange light visible
          end
          else
          begin                               //not orange state
            TLorangerightoff.Visible:=true;   //--> 'orange light off' visible
            TLorangerighton.Visible:=false;   //--> orange light invisible
          end;
          if lamp_green_left_on_off=1 then
          begin                               //green state
            TLgrnrightoff.Visible:=false;     //--> 'green light off' invisible
            TLgrnrighton.Visible:=true;       //--> green light visible
          end
          else
          begin                               //not green state
            TLgrnrightoff.Visible:=true;      //--> 'green light off' visible
            TLgrnrighton.Visible:=false;      //--> green light invisible
          end;
        end;
      end
    end
    else
    begin                                   //final round
      if lamp_red_left_on_off=1 then
      begin                                 //left side red state
        TLredleftoff.Visible:=false;        //--> 'red left light off' invisible
        TLredlefton.Visible:=true;          //--> red left light visible
      end
      else
      begin                                 //left side not red state
        TLredleftoff.Visible:=true;         //--> 'red left light off' visible
        TLredlefton.Visible:=false;         //--> red left light invisible
      end;

      if lamp_orange_left_on_off=1 then
      begin                                 //left side orange state
        TLorangeleftoff.Visible:=false;     //--> 'orange left light off' invisible
        TLorangelefton.Visible:=true;       //--> orange left light visible
      end
      else
      begin                                 //left side not orange state
        TLorangeleftoff.Visible:=true;      //--> 'orange left light off' visible
        TLorangelefton.Visible:=false;      //--> orange left light invisible
      end;

      if lamp_green_left_on_off=1 then
      begin                                 //left side green state
        TLgrnleftoff.Visible:=false;        //--> 'green left light off' invisible
        TLgrnlefton.Visible:=true;          //--> green left light visible
      end
      else
      begin                                 //left side not green state
        TLgrnleftoff.Visible:=true;         //--> 'green left light off' visible
        TLgrnlefton.Visible:=false;         //--> green left light invisible
      end;

      if lamp_red_right_on_off=1 then
      begin                                 //right side red state
        TLredrightoff.Visible:=false;       //--> 'red right light off' invisible
        TLredrighton.Visible:=true;         //--> red right light visible
      end
      else
      begin                                 //right side not red state
        TLredrightoff.Visible:=true;        //--> 'red right light off' visible
        TLredrighton.Visible:=false;        //--> red right light invisible
      end;

      if lamp_orange_right_on_off=1 then
      begin                                 //right side orange state
        TLorangerightoff.Visible:=false;    //--> 'orange right light off' invisible
        TLorangerighton.Visible:=true;      //--> orange right light visible
      end
      else
      begin                                 //right side not orange state
        TLorangerightoff.Visible:=true;     //--> 'orange right light off' visible
        TLorangerighton.Visible:=false;     //--> orange right light invisible
      end;

      if lamp_green_right_on_off=1 then
      begin                                 //right side green state
        TLgrnrightoff.Visible:=false;       //--> 'green right light off' invisible
        TLgrnrighton.Visible:=true;         //--> green right light visible
      end
      else
      begin                                 //right side not green state
        TLgrnrightoff.Visible:=true;        //--> 'green right light off' visible
        TLgrnrighton.Visible:=false;        //--> green right light invisible
      end
    end;
  end
  else
  begin                                     //do not show trafic lights on screen
    TLredrightoff.Visible:=false;           //trafic light invisible
    TLorangerightoff.Visible:=false;        //trafic light invisible
    TLgrnrightoff.Visible:=false;           //trafic light invisible
    TLredrighton.Visible:=false;            //trafic light invisible
    TLorangerighton.Visible:=false;         //trafic light invisible
    TLgrnrighton.Visible:=false;            //trafic light invisible
    TLredleftoff.Visible:=false;            //trafic light invisible
    TLorangeleftoff.Visible:=false;         //trafic light invisible
    TLgrnleftoff.Visible:=false;            //trafic light invisible
    TLredlefton.Visible:=false;             //trafic light invisible
    TLorangelefton.Visible:=false;          //trafic light invisible
    TLgrnlefton.Visible:=false;             //trafic light invisible

  end
end;



procedure TCountdownform.views;
//when something changes like time, state, archer, etc. a change is visible on the sreen.
//after all these changes, this procedure takes care that the correct info is visible on the screen
begin
  if ((FirstTimer.enabled=true) or (secondTimer.enabled=true) or (manualfollowmenuremove=true) ) and ((timeseqpanel.visible=true)or(savesettings.visible=true))then
  begin                                      //if menu's  visible, start delay timer to remove menu's after timeout.
    menuremovedelay.enabled:=true;           //menuremovetimer takes care that the menu is removed after a the time specified
  end;
  if ((FirstTimer.enabled=false) and (secondTimer.enabled=false) and (manualfollowmenuremove=false) ) then
  begin                                      //when timers stop running (for example when pause is selected) there is ne need anymore to remove the menus.
    menuremovedelay.enabled:=false;          //--> menuremove timer is stopped
  end;

  //if alarmstate=1 then  emergencytext.Visible:=true else emergencytext.Visible:=false;

  if archerysystem<>'follow' then
  begin




  if seconds.Checked=true then               //time shown in seconds is selected. (not in minutes)
  begin
    digit3_1.caption:=CurrToStr(countdowntimer mod 10);                 //rightside digit is showing what is left after deviding by 10 --> asume timer is 123, than right digit is 3
    digit2_1.caption:=CurrToStr((countdowntimer mod 100)div 10);        //middle digit is showing what is left after dividing by 100, this is divided by 10. --> asume timer is 123 than middle digit is 2
    digit1_1.caption:=CurrToStr((countdowntimer mod 1000)div 100);      //leftside digit is showing what is left after dividing by 1000, this is divided by 100. --asume timer is 123 than left digit is 1

    digit3_2.caption:=CurrToStr(countdowntimer2 mod 10);                //rightside digit is showing what is left after deviding by 10 --> asume timer is 123, than right digit is 3
    digit2_2.caption:=CurrToStr((countdowntimer2 mod 100)div 10);       //middle digit is showing what is left after dividing by 100, this is divided by 10. --> asume timer is 123 than middle digit is 2
    digit1_2.caption:=CurrToStr((countdowntimer2 mod 1000)div 100);     //leftside digit is showing what is left after dividing by 1000, this is divided by 100. --asume timer is 123 than left digit is 1

  end
  else
  begin                                      //time shown in minutes is selected. (not in seconds)
    digit3_1.caption:=CurrToStr(countdowntimer mod 10);                //rightside digit is showing what is left after deviding by 10 --> asume timer is 123, which means 2:03 minutes. than right digit is 3
    digit2_1.caption:=CurrToStr((countdowntimer mod 60)div 10);        //middle digit is showing what is left after dividing by 60, this is divided by 10. --> asume timer is 123, which means 2:03 minutes. than middle digit is 0
    digit1_1.caption:=CurrToStr((countdowntimer mod 600) div 60);      //leftside digit is showing what is left after dividing by 600, this is divided by 60. --> asume timer is 123, which means 2:03 minutes. than left digit is 2

    digit3_2.caption:=CurrToStr(countdowntimer2 mod 10);               //rightside digit is showing what is left after deviding by 10 --> asume timer is 123, which means 2:03 minutes. than right digit is 3
    digit2_2.caption:=CurrToStr((countdowntimer2 mod 60)div 10);       //middle digit is showing what is left after dividing by 60, this is divided by 10. --> asume timer is 123, which means 2:03 minutes. than middle digit is 0
    digit1_2.caption:=CurrToStr((countdowntimer2 mod 600) div 60);     //leftside digit is showing what is left after dividing by 600, this is divided by 60. --> asume timer is 123, which means 2:03 minutes. than left digit is 2
  end;

  //following digits are used before start of the match (countdown to start of match) This is always in minutes
  digit3_3.caption:=CurrToStr(countdowntimer mod 10);                  //rightside digit is showing what is left after deviding by 10 --> asume timer is 123, which means 2:03 minutes. than right digit is 3
  digit2_3.caption:=CurrToStr((countdowntimer mod 60)div 10);          //middle digit is showing what is left after dividing by 60, this is divided by 10. --> asume timer is 123, which means 2:03 minutes. than middle digit is 0
  digit1_3.caption:=CurrToStr((countdowntimer mod 600) div 60);        //leftside digit is showing what is left after dividing by 600, this is divided by 60. --> asume timer is 123, which means 2:03 minutes. than left digit is 2

  //state is 1 means waiting state. so no reason to show pause icon, nothing to pause
  if (state=1) or (archerysystem='manual') then playpauzeicon.visible:=false else
  begin           //depending on the "hide icons" checkbox, the pause button needs to visible if not in wait state
    if hideicons.checked=false then playpauzeicon.visible:=true else playpauzeicon.visible:=false;
  end;


  end;

  if archerysystem='follow'then
  begin
    SOicon.visible:=false;

  end;

  if (archerysystem='manual') or ((archerysystem='follow') and (followsystem='4'))then
  begin
    serienr.visible:=false;
    SOicon.visible:=false;
    digit1_1.Visible:=false;
    digit2_1.Visible:=false;
    digit3_1.Visible:=false;
    dots_1.Visible:=false;
    serielabel.visible:=false;
    arrowlabel.Visible:=false;

    turnlabel.visible:=false;
    shooternr.Visible:=false;
  end
  else
  begin
    serienr.visible:=true;

  end;
  if (archerysystem='25m1p') or ((archerysystem='follow') and (followsystem='3'))  then
  begin
    if state <> 5 then
    begin
      digit1_1.Visible:=true;
      digit2_1.Visible:=true;
      digit3_1.Visible:=true;

    end;
    serienr.visible:=true;
    serielabel.Visible:=false;                                         //25m1p is per arrow, not per end. --> serie label invisible
    if hideicons.checked=false then  arrowlabel.Visible:=true else arrowlabel.Visible:=false;       //arrow lable visible ( depending on "hide icons" checkbox)
    turnlabel.visible:=false;

    if  rotate25m1p.Checked=false then shooternr.Visible:=true else shooternr.Visible:=false;
    if (FirstTimer.enabled=true) or (state<>1) then SOicon.visible:=false else SOicon.visible:=true ;  //Shoot off (SO) can only be started during wait state, not when the timer is running. If SO can not be selected, the icon should be invisible
  end;
  if (archerysystem='fita') or ((archerysystem='follow') and ((followsystem='0')or(followsystem='1')or(followsystem='2')))then
  begin
    if state <> 5 then
    begin
      digit1_1.Visible:=true;
      digit2_1.Visible:=true;
      digit3_1.Visible:=true;
    end;
    arrowlabel.Visible:=false;      //fita is per end, not per arrow. Arrow label is invisible



    if hideicons.checked=false then
    begin
      if not((archerysystem='follow') and (followsystem='2'))then
      begin
        serielabel.Visible:=true;
        turnlabel.visible:=true;
        shooternr.Visible:=true;

      end;
    end;
    if (FirstTimer.enabled=true)  or (state<>1)  then SOicon.visible:=false else SOicon.visible:=true ;  //Shoot off (SO) can only be started during wait state, not when the timer is running. If SO can not be selected, the icon should be invisible

  end;

  if (archerysystem='fitafin') or ((archerysystem='follow') and (followsystem='2')) then
  begin

    SOicon.visible:=false;         //during fita finals, shoot off doesn't exist
    serienr.visible:=true;
    arrowlabel.Visible:=false;
    serielabel.Visible:=false;
    turnlabel.visible:=false;
    shooternr.Visible:=false;
  end;
  if (archerysystem='fitafin') then
  begin

    if finarrow.Checked=true then
    begin
      digit1_1.Visible:=true;        //during fita finals, two timers are needed (and visible)
      digit2_1.Visible:=true;
      digit3_1.Visible:=true;
      digit1_2.Visible:=true;
      digit2_2.Visible:=true;
      digit3_2.Visible:=true;
      if seconds.Checked=false then      //if minutes notation, dots are visible
      begin
        dots_1.visible:=true;
        dots_2.visible:=true;
      end
      else
      begin
        dots_1.visible:=false;
        dots_2.visible:=false;

      end;
    end;

    if viewleft.Checked=true then
    begin
      digit1_1.Visible:=true;
      digit2_1.Visible:=true;
      digit3_1.Visible:=true;
      digit1_2.Visible:=false;
      digit2_2.Visible:=false;
      digit3_2.Visible:=false;
      dots_2.visible:=false;
      if seconds.Checked=false then      //if minutes notation, dots are visible
      begin
        dots_1.visible:=true;

      end
      else
      begin
        dots_1.visible:=false;
      end;

    end;

    if viewright.Checked=true then
    begin
      digit1_1.Visible:=false;
      digit2_1.Visible:=false;
      digit3_1.Visible:=false;
      digit1_2.Visible:=true;
      digit2_2.Visible:=true;
      digit3_2.Visible:=true;
      dots_1.visible:=false;
      if seconds.Checked=false then      //if minutes notation, dots are visible
      begin
        dots_2.visible:=true;

      end
      else
      begin
        dots_2.visible:=false;
      end;

    end;


    if showtarget.checked=true then        //depending on checkbox the target numbers are shown on the screen
    begin
      lefttarget.Visible:=true;
      lefttarget.Caption:=CurrToStr(leftnumber.Value);
      righttarget.Visible:=true;
      righttarget.Caption:=CurrToStr(rightnumber.Value);
    end
    else
    begin
      lefttarget.Visible:=false;
      righttarget.Visible:=false;
    end;
  end
  else               //not Fita finals
  begin
    digit1_2.Visible:=false;      //only one timer used, so second one invisible
    digit2_2.Visible:=false;
    digit3_2.Visible:=false;
    dots_2.visible:=false;
    lefttarget.Visible:=false;
    righttarget.Visible:=false;

  end;
  if (state = 1) or (state = 6) then    //state is 1 means waiting state
  begin
    if  (archerysystem<>'fitafin') and (archerysystem<>'manual') then
    begin
      if (archerysystem<>'follow') then
      begin


        countdowntostart.Visible:=true;       //Only during waiting state the countdowntostart text (next to icon is vissible. In other situations it is not possible to start the countdown to start timer
        preptime.Visible:=true;               //Only during waiting state the countdowntostart icon is vissible. In other situations it is not possible to start the countdown to start timer
        starttocd.Enabled:=true;               //Only during waiting state the start countdowntostart button in the munu is vissible. In other situations it is not possible to start the countdown to start timer
      end
      else
      begin
        countdowntostart.Visible:=false;
        preptime.Visible:=false;
        starttocd.Enabled:=false;

      end;
      digit1_1.Font.Color:=waitcolor;      // during waiting state the font of the timers are waitingcolor
      dots_1.Font.Color:=waitcolor;
      digit2_1.Font.Color:=waitcolor;
      digit3_1.Font.Color:=waitcolor;

      digit1_2.Font.Color:=waitcolor;
      dots_2.Font.Color:=waitcolor;
      digit2_2.Font.Color:=waitcolor;
      digit3_2.Font.Color:=waitcolor;

      lamp_red_left_on_off:=1;               //During waiting state, the trafic lights (HW) are red
      lamp_red_right_on_off:=1;
      lamp_orange_left_on_off:=0;
      lamp_orange_right_on_off:=0;
      lamp_green_left_on_off:=0;
      lamp_green_right_on_off:=0;




    end
    else         //fita finals
    begin
      countdowntostart.Visible:=false;
      preptime.Visible:=false;
      starttocd.Enabled:=false;
      lamp_red_left_on_off:=1;                  //During waiting state, the trafic lights (HW) are red
      lamp_orange_left_on_off:=0;
      lamp_green_left_on_off:=0;
      lamp_red_right_on_off:=1;
      lamp_orange_right_on_off:=0;
      lamp_green_right_on_off:=0;

      if fitafinarcher='none' then               //if not defined yet which archer starts. left and right timer Font are red
      begin
        if finarrow.Checked=true then
        begin
          digit1_1.Font.Color:=redcolor;
          dots_1.Font.Color:=redcolor;
          digit2_1.Font.Color:=redcolor;
          digit3_1.Font.Color:=redcolor;

          digit1_2.Font.Color:=redcolor;
          dots_2.Font.Color:=redcolor;
          digit2_2.Font.Color:=redcolor;
          digit3_2.Font.Color:=redcolor;

        end
        else
        begin
          digit1_1.Font.Color:=waitcolor;
          dots_1.Font.Color:=waitcolor;
          digit2_1.Font.Color:=waitcolor;
          digit3_1.Font.Color:=waitcolor;

          digit1_2.Font.Color:=waitcolor;
          dots_2.Font.Color:=waitcolor;
          digit2_2.Font.Color:=waitcolor;
          digit3_2.Font.Color:=waitcolor;

        end;


      end;
      if fitafinarcher='left' then              //if left archer starts, right archer get red font color, Left archer get wait color
      begin
        digit1_1.Font.Color:=waitcolor;
        dots_1.Font.Color:=waitcolor;
        digit2_1.Font.Color:=waitcolor;
        digit3_1.Font.Color:=waitcolor;
        if finarrow.Checked=true then
        begin
          digit1_2.Font.Color:=redcolor;
          dots_2.Font.Color:=redcolor;
          digit2_2.Font.Color:=redcolor;
          digit3_2.Font.Color:=redcolor;
        end
        else
        begin
          digit1_2.Font.Color:=waitcolor;
          dots_2.Font.Color:=waitcolor;
          digit2_2.Font.Color:=waitcolor;
          digit3_2.Font.Color:=waitcolor;

        end;
      end;
      if fitafinarcher='right' then             //if right archer starts, left archer get red font color, right archer get wait color
      begin
        if finarrow.Checked=true then
        begin
          digit1_1.Font.Color:=redcolor;
          dots_1.Font.Color:=redcolor;
          digit2_1.Font.Color:=redcolor;
          digit3_1.Font.Color:=redcolor;
        end
        else
        begin
          digit1_1.Font.Color:=waitcolor;
          dots_1.Font.Color:=waitcolor;
          digit2_1.Font.Color:=waitcolor;
          digit3_1.Font.Color:=waitcolor;

        end;

        digit1_2.Font.Color:=waitcolor;
        dots_2.Font.Color:=waitcolor;
        digit2_2.Font.Color:=waitcolor;
        digit3_2.Font.Color:=waitcolor;

      end;

    end;


    archeryclock.visible:=true;  //show label because timing is in between ends
    show_commercial.Enabled:=true; //start timer to change text in label

  end
  else   //state is not 1  (not wait state)
  begin
    countdowntostart.Visible:=false;        //Only during waiting state the countdowntostart text (next to icon is vissible. In other situations it is not possible to start the countdown to start timer
    preptime.Visible:=false;                //Only during waiting state the countdowntostart icon is vissible. In other situations it is not possible to start the countdown to start timer
    starttocd.Enabled:=false;               //Only during waiting state the start countdowntostart button in the munu is vissible. In other situations it is not possible to start the countdown to start timer
  end;
  if state = 2 then   //state =2 means red time
  begin

    digit1_1.Font.Color:=redcolor;          // during red state the font of the timers are redcolor
    dots_1.Font.Color:=redcolor;
    digit2_1.Font.Color:=redcolor;
    digit3_1.Font.Color:=redcolor;
    digit1_2.Font.Color:=redcolor;
    dots_2.Font.Color:=redcolor;
    digit2_2.Font.Color:=redcolor;
    digit3_2.Font.Color:=redcolor;

    lamp_red_left_on_off:=1;                //During red state, the trafic lights (HW) are red
    lamp_orange_left_on_off:=0;
    lamp_green_left_on_off:=0;
    lamp_red_right_on_off:=1;
    lamp_orange_right_on_off:=0;
    lamp_green_right_on_off:=0;
    If (archerysystem<>'manual') and not((archerysystem='follow') and (followsystem='4'))then
    begin
      archeryclock.visible:=false;  //hide label because time is ticking
      show_commercial.Enabled:=false;
    end;

  end;
  if state = 3 then     //state =3 means green state
  begin

    if  archerysystem<>'fitafin'then
    begin
      digit1_1.Font.Color:=greencolor;       // during green state the font of the timers are greencolor
      dots_1.Font.Color:=greencolor;
      digit2_1.Font.Color:=greencolor;
      digit3_1.Font.Color:=greencolor;
      lamp_red_left_on_off:=0;
      lamp_red_right_on_off:=0;
      lamp_orange_left_on_off:=0;
      lamp_orange_right_on_off:=0;
      lamp_green_left_on_off:=1;          //During green state, the trafic lights (HW) are green
      lamp_green_right_on_off:=1;

    

    end
    else
    begin
      if fitafinarcher='left'then
      begin                                //during green state finals, left archer shooting means left archer green light
        digit1_1.Font.Color:=greencolor;
        dots_1.Font.Color:=greencolor;
        digit2_1.Font.Color:=greencolor;
        digit3_1.Font.Color:=greencolor;
        digit1_2.Font.Color:=redcolor;
        dots_2.Font.Color:=redcolor;
        digit2_2.Font.Color:=redcolor;
        digit3_2.Font.Color:=redcolor;
        lamp_red_left_on_off:=0;
        lamp_orange_left_on_off:=0;
        lamp_green_left_on_off:=1;         //during green state finals, left archer shooting means left archer green light (HW)
        lamp_red_right_on_off:=1;          //during green state finals, left archer shooting means right archer still red light
        lamp_orange_right_on_off:=0;
        lamp_green_right_on_off:=0;

      end
      else        //right archer
      begin
        digit1_1.Font.Color:=redcolor;       //during green state finals, right archer shooting means right archer green light
        dots_1.Font.Color:=redcolor;
        digit2_1.Font.Color:=redcolor;
        digit3_1.Font.Color:=redcolor;
        digit1_2.Font.Color:=greencolor;
        dots_2.Font.Color:=greencolor;
        digit2_2.Font.Color:=greencolor;
        digit3_2.Font.Color:=greencolor;
        lamp_red_left_on_off:=1;             //during green state finals, right archer shooting means left archer still red light
        lamp_orange_left_on_off:=0;
        lamp_green_left_on_off:=0;
        lamp_red_right_on_off:=0;
        lamp_orange_right_on_off:=0;
        lamp_green_right_on_off:=1;           //during green state finals, right archer shooting means right archer green light (HW)
      end;

    end;
    If (archerysystem<>'manual')// and ((archerysystem<>'follow'))
    then
    begin

      archeryclock.visible:=false;    //hide label because time is ticking
      show_commercial.Enabled:=false;

    end;
  end;
  if state = 4 then            //state =4 means orange state
  begin


    if  archerysystem<>'fitafin'then
    begin
      digit1_1.Font.Color:=orangecolor;
      dots_1.Font.Color:=orangecolor;
      digit2_1.Font.Color:=orangecolor;
      digit3_1.Font.Color:=orangecolor;
      lamp_red_left_on_off:=0;
      lamp_red_right_on_off:=0;
      lamp_orange_left_on_off:=1;             //During orange state, the trafic lights (HW) are orange
      lamp_orange_right_on_off:=1;
      lamp_green_left_on_off:=0;
      lamp_green_right_on_off:=0;

    end
    else
    begin
      if fitafinarcher='left'then
      begin
        digit1_1.Font.Color:=orangecolor;          //during orange state finals, left archer shooting means left archer orange light
        dots_1.Font.Color:=orangecolor;
        digit2_1.Font.Color:=orangecolor;
        digit3_1.Font.Color:=orangecolor;
        digit1_2.Font.Color:=redcolor;
        dots_2.Font.Color:=redcolor;
        digit2_2.Font.Color:=redcolor;
        digit3_2.Font.Color:=redcolor;
        lamp_red_left_on_off:=0;
        lamp_orange_left_on_off:=1;                //during orange state finals, left archer shooting means left archer orange light (HW)
        lamp_green_left_on_off:=0;
        lamp_red_right_on_off:=1;                  //during orange state finals, left archer shooting means right archer still red light
        lamp_orange_right_on_off:=0;
        lamp_green_right_on_off:=0;
      end
      else                //right archer
      begin
        digit1_1.Font.Color:=redcolor;              //during orange state finals, right archer shooting means right archer orange light
        dots_1.Font.Color:=redcolor;
        digit2_1.Font.Color:=redcolor;
        digit3_1.Font.Color:=redcolor;
        digit1_2.Font.Color:=orangecolor;
        dots_2.Font.Color:=orangecolor;
        digit2_2.Font.Color:=orangecolor;
        digit3_2.Font.Color:=orangecolor;
        lamp_red_left_on_off:=1;                 //during orange state finals, right archer shooting means left archer still red light
        lamp_orange_left_on_off:=0;
        lamp_green_left_on_off:=0;
        lamp_red_right_on_off:=0;
        lamp_orange_right_on_off:=1;             //during orange state finals, right archer shooting means right archer orange light (HW)
        lamp_green_right_on_off:=0;
      end;
    end;

    If (archerysystem<>'manual')// and ((archerysystem<>'follow'))
    then
    begin

      archeryclock.visible:=false;    //hide label because time is ticking
      show_commercial.Enabled:=false;

    end;
  end;



  if state = 5 then       //state 5 means the timer before start of match is running to show the audience how long it takes before the match starts
  begin
    beforestartbg.visible:=true;        //enable blue screen
    beforestarttxt2.visible:=true;
    beforestarttxt1.visible:=true;
    digit1_3.visible:=true;            // show timer digits for timer before match start
    digit2_3.visible:=true;
    digit3_3.visible:=true;
    dots_3.visible:=true;             // This timer is always shown in minutes (not seconds

    digit1_1.visible:=false;
    digit2_1.visible:=false;
    digit3_1.visible:=false;
    dots_1.visible:=false;
    lamp_red_left_on_off:=1;           //trafic lights stay red because it is not aloud to shoot
    lamp_red_right_on_off:=1;
    lamp_orange_left_on_off:=0;
    lamp_orange_right_on_off:=0;
    lamp_green_left_on_off:=0;
    lamp_green_right_on_off:=0;
    archeryclock.visible:=false;
    show_commercial.Enabled:=false;
  end
  else    //not state 5
  begin
    beforestartbg.visible:=false;        // disable blue screen
    beforestarttxt2.visible:=false;
    beforestarttxt1.visible:=false;
    digit1_3.visible:=false;
    digit2_3.visible:=false;
    digit3_3.visible:=false;
    dots_3.visible:=false;
    if ((archerysystem <> 'manual')and(archerysystem <> 'fitafin')and  not((archerysystem='follow')and(followsystem='4'))) then   // and  ((archerysystem<>'follow'))
    begin
      digit1_1.visible:=true;
      digit2_1.visible:=true;
      digit3_1.visible:=true;
   //   dots_1.Visible:=true;
    end;
    if (seconds.Checked=false) and (archerysystem <> 'manual') and  not((archerysystem='follow')and(followsystem='4')) then dots_1.visible:=true else dots_1.visible:=false;

  end;


  if ((archerysystem='fita') and (Shootoff=0))or((archerysystem='follow')and((followsystem='0')or(followsystem='1'))) then
  begin             // depending on how many shooters per target (A-B-C-D) depends how many are visible on screen,
    if (Shooters>=2) and showABCD then Shooter1.Visible:=true else Shooter1.Visible:=false;    //if only 1 shooter, it is not needed to show "A"
    if (Shooters>=2) and showABCD then Shooter2.Visible:=true else Shooter2.Visible:=false;
    if (Shooters>=3) and showABCD then Shooter3.Visible:=true else Shooter3.Visible:=false;
    if (Shooters>=4) and showABCD then Shooter4.Visible:=true else Shooter4.Visible:=false;
    if (Shooters>=5) and showABCD then Shooter5.Visible:=true else Shooter5.Visible:=false;
    if (Shooters>=6) and showABCD then Shooter6.Visible:=true else Shooter6.Visible:=false;

  end
  else     //not fita, so ABCD invisible
  begin
    Shooter1.Visible:=false;
    Shooter2.Visible:=false;
    Shooter3.Visible:=false;
    Shooter4.Visible:=false;
    Shooter5.Visible:=false;
    Shooter6.Visible:=false;
    TOPshooterlet.Visible:=false;
    TOPshootertxt.Visible:=false;
    BOTshooterlet.Visible:=false;
    BOTshootertxt.Visible:=false;

  end;

  if ((archerysystem='25m1p') and (Shootoff=0)) or ((archerysystem='follow')and(followsystem='3')) then
  begin
    shooteronearrownr.Visible:=true;
    shooteronearrow.Visible:=true;
  end
  else    //not 25m1p
  begin
    shooteronearrownr.Visible:=false;
    shooteronearrow.Visible:=false;
  end;

  if (archerysystem='fitafin') and (Shootoff=0) then
  begin
    if (state=1) and (savesettings.visible=false) and (timeseqpanel.visible=false) then  finalchoose.Visible:=true else finalchoose.Visible:=false;
    leftstart.Visible:=true;
    rightstart.Visible:=true;

    if fitafinarcher = 'none' then   //not selected which archer is (starting) shooting
    begin
      //arrows are grey if selection left or right is not done. Choose button is red
      greenleft.Visible:=false;
      greenright.Visible:=false;
      greyleft.Visible:=true;
      greyright.Visible:=true;

      //finalchoose.Visible:=true;
      finalchoose.Color:=cllime;
      righttarget.Font.Color:=clred;
      lefttarget.Font.Color:=clred;
    end;
    if fitafinarcher = 'left' then   //left archer selected as (starting) shooting
    begin
      //left arrow is green, right arrow is grey. if left side is selected. Choose button is grey
      greenleft.Visible:=true;
      greenright.Visible:=false;
      greyleft.Visible:=false;
      greyright.Visible:=true;
      //finalchoose.Visible:=true;
      finalchoose.Color:=clgray;
      righttarget.Font.Color:=clred;
      lefttarget.Font.Color:=cllime;

    end;
    if fitafinarcher = 'right' then       //right archer selected as (starting) shooting
    begin
      //right arrow is green, left arrow is grey. if right side is selected. Choose button is grey
      greenleft.Visible:=false;
      greenright.Visible:=true;
      greyleft.Visible:=true;
      greyright.Visible:=false;
      //finalchoose.Visible:=true;
      finalchoose.Color:=clgray;
      righttarget.Font.Color:=cllime;
      lefttarget.Font.Color:=clred;

    end;
    if fitafinstartarcher='right' then
    begin
      //update text and color of primary and secundary
      rightstart.font.Color:=cllime;
      rightstart.Caption:='Primary';
      leftstart.font.Color:=clgray;
      leftstart.caption:='Secundary';
    end;
    if fitafinstartarcher='left' then
    begin
      //update text and color of primary and secundary
      rightstart.font.Color:=clgray;
      rightstart.Caption:='Secundary';
      leftstart.font.Color:=cllime;
      leftstart.caption:='Primary';
    end;

    if fitafinstartarcher='none' then         //not selected which archer is (starting) shooting
    begin
      //update text and color of primary and secundary
      rightstart.font.Color:=clgray;
      rightstart.Caption:='--';
      leftstart.font.Color:=clgray;
      leftstart.caption:='--';
    end;
  end
  else    //not fita finals
  begin //arrows etc, specially for final rounds are invisible during nonFinal rounds
    if not((archerysystem='follow') and (followsystem='2')) then
    begin
    leftstart.Visible:=false;
    rightstart.Visible:=false;
    greenleft.Visible:=false;
    greenright.Visible:=false;
    greyleft.Visible:=false;
    greyright.Visible:=false;
    finalchoose.Visible:=false;

    end;

  end;

  
  serienr.Caption:=CurrToStr(serienumber);                                    //show correct end number in the label
  if Practiseturn=1 then practise.Visible:=true else practise.Visible:=false; //show indication if it is a practise end or not
  shooternr.Caption:=CurrToStr(turnnumber);                                   //show turn number in label
  // shooteronearrownr.Caption:=CurrToStr(turnnumber);
  if rotate25m1p.Checked=false then shooteronearrownr.Caption:=CurrToStr(((turnnumber+((serienumber-1) mod nrof1pshooters.Value)-1)mod nrof1pshooters.Value)+1) else shooteronearrownr.Caption:=CurrToStr(turnnumber);
  //set the correct colors for shooters (ABCD) depending on the turn number

  if  (Archersperturn=1) then if (turnnumber mod (Turnsperserie+1) = 1)  then shooter1.Font.Color:=shootercolor else shooter1.Font.Color:=nonshootercolor;
  if  (Archersperturn=1) then if (turnnumber mod (Turnsperserie+1) = 2)  then shooter2.Font.Color:=shootercolor else shooter2.Font.Color:=nonshootercolor;
  if  (Archersperturn=1) then if (turnnumber mod (Turnsperserie+1) = 3)  then shooter3.Font.Color:=shootercolor else shooter3.Font.Color:=nonshootercolor;
  if  (Archersperturn=1) then if (turnnumber mod (Turnsperserie+1) = 4)  then shooter4.Font.Color:=shootercolor else shooter4.Font.Color:=nonshootercolor;
  if  (Archersperturn=1) then if (turnnumber mod (Turnsperserie+1) = 5)  then shooter5.Font.Color:=shootercolor else shooter5.Font.Color:=nonshootercolor;
  if  (Archersperturn=1) then if (turnnumber mod (Turnsperserie+1) = 6)  then shooter6.Font.Color:=shootercolor else shooter6.Font.Color:=nonshootercolor;
  if  (Archersperturn=2) then if (turnnumber mod (Turnsperserie+1) = 1)  then shooter1.Font.Color:=shootercolor else shooter1.Font.Color:=nonshootercolor;
  if  (Archersperturn=2) then if (turnnumber mod (Turnsperserie+1) = 1)  then shooter2.Font.Color:=shootercolor else shooter2.Font.Color:=nonshootercolor;
  if  (Archersperturn=2) then if (turnnumber mod (Turnsperserie+1) = 2)  then shooter3.Font.Color:=shootercolor else shooter3.Font.Color:=nonshootercolor;
  if  (Archersperturn=2) then if (turnnumber mod (Turnsperserie+1) = 2)  then shooter4.Font.Color:=shootercolor else shooter4.Font.Color:=nonshootercolor;
  if  (Archersperturn=2) then if (turnnumber mod (Turnsperserie+1) = 3)  then shooter5.Font.Color:=shootercolor else shooter5.Font.Color:=nonshootercolor;
  if  (Archersperturn=2) then if (turnnumber mod (Turnsperserie+1) = 3)  then shooter6.Font.Color:=shootercolor else shooter6.Font.Color:=nonshootercolor;
  if  (Archersperturn=3) then if (turnnumber mod (Turnsperserie+1) = 1)  then shooter1.Font.Color:=shootercolor else shooter1.Font.Color:=nonshootercolor;
  if  (Archersperturn=3) then if (turnnumber mod (Turnsperserie+1) = 1)  then shooter2.Font.Color:=shootercolor else shooter2.Font.Color:=nonshootercolor;
  if  (Archersperturn=3) then if (turnnumber mod (Turnsperserie+1) = 1)  then shooter3.Font.Color:=shootercolor else shooter3.Font.Color:=nonshootercolor;
  if  (Archersperturn=3) then if (turnnumber mod (Turnsperserie+1) = 2)  then shooter4.Font.Color:=shootercolor else shooter4.Font.Color:=nonshootercolor;
  if  (Archersperturn=3) then if (turnnumber mod (Turnsperserie+1) = 2)  then shooter5.Font.Color:=shootercolor else shooter5.Font.Color:=nonshootercolor;
  if  (Archersperturn=3) then if (turnnumber mod (Turnsperserie+1) = 2)  then shooter6.Font.Color:=shootercolor else shooter6.Font.Color:=nonshootercolor;

  //if  (Archersperturn=1) then if (turnnumber mod (Turnsperserie+1) = 2)  then if not showABCD thenshooter2.Font.Color:=shootercolor else shooter2.Font.Color:=nonshootercolor;

  //set A, B, C or D on the correct shooters. depending on archers per target etc.
  if (archerysystem='follow')  then
  if((followsystem='2')) then
  begin
    if followleft then
    begin
      greenleft.visible:=true;
      greyleft.visible:=false;
    end
    else
    begin
      greenleft.visible:=false;
      greyleft.visible:=true;
    end;
    if followright then
    begin
      greenright.visible:=true;
      greyright.visible:=false;
    end
    else
    begin
      greenright.visible:=false;
      greyright.visible:=true;
    end;


  end
  else
  begin
    greyleft.visible:=false;
    greyright.visible:=false;
    greenleft.visible:=false;
    greenright.visible:=false;
  end;

  if (archerysystem='fita') or ((archerysystem='follow') and ((followsystem='0')or(followsystem='1')))then
  begin
    if showABCD then
    begin
      TOPshooterlet.Visible:=false;
      TOPshootertxt.Visible:=false;
      BOTshooterlet.Visible:=false;
      BOTshootertxt.Visible:=false;

    end;

    if  (Archersperturn=3) and (Turnsperserie=2) then
    begin
      if  (((((serienumber+nrofturns-1)div nrofturns)  mod Turnsperserie) = 1) or (Practiseturn=1))or (ABCDperEND.Checked=true)  then
      begin
        shooter1.Caption:='A';
        shooter2.Caption:='B';
        shooter3.Caption:='C';
        shooter4.Caption:='D';
        shooter5.Caption:='E';
        shooter6.Caption:='F';


      end;
      if  (((((serienumber+nrofturns-1)div nrofturns)  mod Turnsperserie) = 0) and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
      begin
        shooter1.Caption:='D';
        shooter2.Caption:='E';
        shooter3.Caption:='F';
        shooter4.Caption:='A';
        shooter5.Caption:='B';
        shooter6.Caption:='C';


      end;
   end;


  if  (Archersperturn=2) and (Turnsperserie=2) then
  begin
    if  (((((serienumber+nrofturns-1)div nrofturns)  mod Turnsperserie) = 1) or (Practiseturn=1))or (ABCDperEND.Checked=true)  then
    begin
      shooter1.Caption:='A';
      shooter2.Caption:='B';
      shooter3.Caption:='C';
      shooter4.Caption:='D';
    end;
    if  (((((serienumber+nrofturns-1)div nrofturns)  mod Turnsperserie) = 0) and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='C';
      shooter2.Caption:='D';
      shooter3.Caption:='A';
      shooter4.Caption:='B';
    end;
  end;

  if  (Archersperturn=2) and (Turnsperserie=3) then
  begin
    if  (((((serienumber+nrofturns-1)div nrofturns)  mod Turnsperserie) = 1) or (Practiseturn=1))or (ABCDperEND.Checked=true)  then
    begin
      shooter1.Caption:='A';
      shooter2.Caption:='B';
      shooter3.Caption:='C';
      shooter4.Caption:='D';
      shooter5.Caption:='E';
      shooter6.Caption:='F';


    end;
    if  (((((serienumber+nrofturns-1)div nrofturns)  mod Turnsperserie) = 2) and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='E';
      shooter2.Caption:='F';
      shooter3.Caption:='A';
      shooter4.Caption:='B';
      shooter5.Caption:='C';
      shooter6.Caption:='D';


    end;


    if  (((((serienumber+nrofturns-1)div nrofturns)  mod Turnsperserie) = 0) and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='C';
      shooter2.Caption:='D';
      shooter3.Caption:='E';
      shooter4.Caption:='F';
      shooter5.Caption:='A';
      shooter6.Caption:='B';
    end;
  end;

  if  (Archersperturn=1) and (Turnsperserie=5) then
  begin
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 1) or (Practiseturn=1))or (ABCDperEND.Checked=true) then
    begin
      shooter1.Caption:='A';
      shooter2.Caption:='B';
      shooter3.Caption:='C';
      shooter4.Caption:='D';
      shooter5.Caption:='E';
    end;
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 2)  and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='E';
      shooter2.Caption:='A';
      shooter3.Caption:='B';
      shooter4.Caption:='C';
      shooter5.Caption:='D';
    end;
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 3)  and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='D';
      shooter2.Caption:='E';
      shooter3.Caption:='A';
      shooter4.Caption:='B';
      shooter5.Caption:='C';
    end;
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 4)  and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='C';
      shooter2.Caption:='D';
      shooter3.Caption:='E';
      shooter4.Caption:='A';
      shooter5.Caption:='B';
    end;
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 0) and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='B';
      shooter2.Caption:='C';
      shooter3.Caption:='D';
      shooter4.Caption:='E';
      shooter5.Caption:='A';
    end;

  end;

    if  (Archersperturn=1) and (Turnsperserie=6) then
  begin
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 1) or (Practiseturn=1))or (ABCDperEND.Checked=true) then
    begin
      shooter1.Caption:='A';
      shooter2.Caption:='B';
      shooter3.Caption:='C';
      shooter4.Caption:='D';
      shooter5.Caption:='E';
      shooter6.Caption:='F';
    end;
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 2)  and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='F';
      shooter2.Caption:='A';
      shooter3.Caption:='B';
      shooter4.Caption:='C';
      shooter5.Caption:='D';
      shooter6.Caption:='E';
    end;
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 3)  and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='E';
      shooter2.Caption:='F';
      shooter3.Caption:='A';
      shooter4.Caption:='B';
      shooter5.Caption:='C';
      shooter6.Caption:='D';
    end;
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 4)  and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='D';
      shooter2.Caption:='E';
      shooter3.Caption:='F';
      shooter4.Caption:='A';
      shooter5.Caption:='B';
      shooter6.Caption:='C';
    end;
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 5) and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='C';
      shooter2.Caption:='D';
      shooter3.Caption:='E';
      shooter4.Caption:='F';
      shooter5.Caption:='A';
      shooter6.Caption:='B';
    end;
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 0) and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='B';
      shooter2.Caption:='C';
      shooter3.Caption:='D';
      shooter4.Caption:='E';
      shooter5.Caption:='F';
      shooter6.Caption:='A';
    end;

  end;



  if  (Archersperturn=1) and (Turnsperserie=4) then
  begin
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 1) or (Practiseturn=1))or (ABCDperEND.Checked=true) then
    begin
      shooter1.Caption:='A';
      shooter2.Caption:='B';
      shooter3.Caption:='C';
      shooter4.Caption:='D';
    end;
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 2) and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='D';
      shooter2.Caption:='A';
      shooter3.Caption:='B';
      shooter4.Caption:='C';
    end;
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 3)  and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='C';
      shooter2.Caption:='D';
      shooter3.Caption:='A';
      shooter4.Caption:='B';
    end;
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 0)  and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='B';
      shooter2.Caption:='C';
      shooter3.Caption:='D';
      shooter4.Caption:='A';
    end;
  end;


  if  (Archersperturn=1) and (Turnsperserie=3) then
  begin
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 1) or (Practiseturn=1))or (ABCDperEND.Checked=true) then
    begin
      shooter1.Caption:='A';
      shooter2.Caption:='B';
      shooter3.Caption:='C';
    end;
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 2) and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='C';
      shooter2.Caption:='A';
      shooter3.Caption:='B';
    end;
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 0) and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='B';
      shooter2.Caption:='C';
      shooter3.Caption:='A';
    end;
  end;

  if  (Archersperturn=1) and (Turnsperserie=2) then
  begin
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 1) or (Practiseturn=1))or (ABCDperEND.Checked=true) then
    begin
      shooter1.Caption:='A';
      shooter2.Caption:='B';
    end;
    if  ((((serienumber+nrofturns-1) div nrofturns) mod Turnsperserie = 0) and (Practiseturn=0)) and (ABCDperEND.Checked=false) then
    begin
      shooter1.Caption:='B';
      shooter2.Caption:='A';
    end;
    if (((shooter1.Caption='A') and (shooter1.Font.Color=shootercolor))or((shooter2.Caption='A') and (shooter2.Font.Color=shootercolor))) and (not showABCD) then
    begin
      TOPshooterlet.Visible:=true;
      TOPshootertxt.Visible:=true;
      BOTshooterlet.Visible:=false;
      BOTshootertxt.Visible:=false;
    end;
    if (((shooter1.Caption='B') and (shooter1.Font.Color=shootercolor))or((shooter2.Caption='B') and (shooter2.Font.Color=shootercolor))) and (not showABCD) then
    begin
      TOPshooterlet.Visible:=false;
      TOPshootertxt.Visible:=false;
      BOTshooterlet.Visible:=true;
      BOTshootertxt.Visible:=true;
    end;


  end;

  end
  else
  begin
    if (archerysystem='follow')and((followsystem='0')or(followsystem='1')) then
    begin
      shooter6.Caption := bitstoABCD(folsecdetailssec[7], folsecdetailssec[8],folsecdetailssec[9]);
      shooter5.Caption := bitstoABCD(folsecdetailssec[10], folsecdetailssec[11],folsecdetailssec[12]);
      shooter4.Caption := bitstoABCD(folsecdetails[1], folsecdetails[2],folsecdetails[3]);
      shooter3.Caption := bitstoABCD(folsecdetails[4], folsecdetails[5],folsecdetails[6]);
      shooter2.Caption := bitstoABCD(folsecdetails[7], folsecdetails[8],folsecdetails[9]);
      shooter1.Caption := bitstoABCD(folsecdetails[10], folsecdetails[11],folsecdetails[12]);
    end;

  end;

  //set correct help text to shooters
  If shooter1.caption='A'then shooter1.Hint:=ActAtxt;
  If shooter1.caption='B'then shooter1.Hint:=ActBtxt;
  If shooter1.caption='C'then shooter1.Hint:=ActCtxt;
  If shooter1.caption='D'then shooter1.Hint:=ActDtxt;
  If shooter1.caption='E'then shooter1.Hint:=ActEtxt;
  If shooter1.caption='F'then shooter1.Hint:=ActFtxt;
  If shooter2.caption='A'then shooter2.Hint:=ActAtxt;
  If shooter2.caption='B'then shooter2.Hint:=ActBtxt;
  If shooter2.caption='C'then shooter2.Hint:=ActCtxt;
  If shooter2.caption='D'then shooter2.Hint:=ActDtxt;
  If shooter2.caption='E'then shooter2.Hint:=ActEtxt;
  If shooter2.caption='F'then shooter2.Hint:=ActFtxt;
  If shooter3.caption='A'then shooter3.Hint:=ActAtxt;
  If shooter3.caption='B'then shooter3.Hint:=ActBtxt;
  If shooter3.caption='C'then shooter3.Hint:=ActCtxt;
  If shooter3.caption='D'then shooter3.Hint:=ActDtxt;
  If shooter3.caption='E'then shooter3.Hint:=ActEtxt;
  If shooter3.caption='F'then shooter3.Hint:=ActFtxt;
  If shooter4.caption='A'then shooter4.Hint:=ActAtxt;
  If shooter4.caption='B'then shooter4.Hint:=ActBtxt;
  If shooter4.caption='C'then shooter4.Hint:=ActCtxt;
  If shooter4.caption='D'then shooter4.Hint:=ActDtxt;
  If shooter4.caption='E'then shooter4.Hint:=ActEtxt;
  If shooter4.caption='F'then shooter4.Hint:=ActFtxt;
  If shooter5.caption='A'then shooter5.Hint:=ActAtxt;
  If shooter5.caption='B'then shooter5.Hint:=ActBtxt;
  If shooter5.caption='C'then shooter5.Hint:=ActCtxt;
  If shooter5.caption='D'then shooter5.Hint:=ActDtxt;
  If shooter5.caption='E'then shooter5.Hint:=ActEtxt;
  If shooter5.caption='F'then shooter5.Hint:=ActFtxt;
  If shooter6.caption='A'then shooter6.Hint:=ActAtxt;
  If shooter6.caption='B'then shooter6.Hint:=ActBtxt;
  If shooter6.caption='C'then shooter6.Hint:=ActCtxt;
  If shooter6.caption='D'then shooter6.Hint:=ActDtxt;
  If shooter6.caption='E'then shooter6.Hint:=ActEtxt;
  If shooter6.caption='F'then shooter6.Hint:=ActFtxt;
  //show helptext on ABCD depending on color (because the color of the font indicates if the archer is active)
  If ((shooter1.Font.Color=nonshootercolor) and (showhints.checked=true)and (archerysystem<>'follow')) then shooter1.ShowHint:=true else shooter1.ShowHint:=false;
  If ((shooter2.Font.Color=nonshootercolor) and (showhints.checked=true)and (archerysystem<>'follow')) then shooter2.ShowHint:=true else shooter2.ShowHint:=false;
  If ((shooter3.Font.Color=nonshootercolor) and (showhints.checked=true)and (archerysystem<>'follow')) then shooter3.ShowHint:=true else shooter3.ShowHint:=false;
  If ((shooter4.Font.Color=nonshootercolor) and (showhints.checked=true)and (archerysystem<>'follow')) then shooter4.ShowHint:=true else shooter4.ShowHint:=false;
  If ((shooter5.Font.Color=nonshootercolor) and (showhints.checked=true)and (archerysystem<>'follow')) then shooter5.ShowHint:=true else shooter5.ShowHint:=false;
  If ((shooter6.Font.Color=nonshootercolor) and (showhints.checked=true)and (archerysystem<>'follow')) then shooter6.ShowHint:=true else shooter6.ShowHint:=false;

  //switch on or off the correct ABCD lights  (HW)
  if  (((Shootoff=0)and(archerysystem='fita')or((archerysystem='follow')and((followsystem='0')or(followsystem='1'))))and ((Turnsperserie >1) and
  ((Shooter1.Caption='A') and (turnnumber=1)) or ((Shooter2.Caption='A') and (turnnumber=2)and(Archersperturn=1)) or ((Shooter3.Caption='A') and (turnnumber=3)and(Archersperturn=1)) or ((Shooter3.Caption='A') and (turnnumber=2)and(Archersperturn=2)) or ((Shooter4.Caption='A') and (turnnumber=4)and(Archersperturn=1)) or ((Shooter4.Caption='A') and (turnnumber=2)and(Archersperturn=3)) or ((Shooter5.Caption='A') and (turnnumber=5)and(Archersperturn=1)) or ((Shooter5.Caption='A') and (turnnumber=3)and(Archersperturn=2)) or ((Shooter6.Caption='A') and (turnnumber=6)and(Archersperturn=1)) ))
  or ((((Shootoff=0)and(archerysystem='25m1p'))or((archerysystem='follow')and(followsystem='3')))and (shooteronearrownr.caption='1')and (abcd25m1p.checked=true)) then
  begin
    LampA_on_off:=1;
    Not_LampA_on_off:=0;
  end
  else
  begin
    LampA_on_off:=0;
    if (Turnsperserie>1) then Not_LampA_on_off:=1 else Not_LampA_on_off:=0 ;
  end;
  if  (((Shootoff=0)and(archerysystem='fita')or((archerysystem='follow')and((followsystem='0')or(followsystem='1'))))and ((Turnsperserie >1) and
  ((Shooter1.Caption='B') and (turnnumber=1 )and (Archersperturn=1)) or ((Shooter2.Caption='B') and (turnnumber=2)and(Archersperturn=1)) or ((Shooter2.Caption='B') and (turnnumber=1)and(Archersperturn=2)) or ((Shooter2.Caption='B') and (turnnumber=1)and(Archersperturn=3)) or ((Shooter3.Caption='B') and (turnnumber=3)and(Archersperturn=1)) or ((Shooter4.Caption='B') and (turnnumber=4 )and( Archersperturn=1)) or ((Shooter4.Caption='B') and (turnnumber=2 )and( Archersperturn=2)) or ((Shooter5.Caption='B') and (turnnumber=5)and(Archersperturn=1)) or ((Shooter5.Caption='B') and (turnnumber=2)and(Archersperturn=3)) or ((Shooter6.Caption='B') and (turnnumber=6)and(Archersperturn=1)) or ((Shooter6.Caption='B') and (turnnumber=3)and(Archersperturn=2))))
  or ((((Shootoff=0)and(archerysystem='25m1p'))or((archerysystem='follow')and(followsystem='3')))and (shooteronearrownr.caption='2')and (abcd25m1p.checked=true)) then
  begin
    LampB_on_off:=1;
    Not_LampB_on_off:=0;
  end
  else
  begin
    LampB_on_off:=0;
    if (Turnsperserie>1) then Not_LampB_on_off:=1 else Not_LampB_on_off:=0;
  end;
  if  (((Shootoff=0)and(archerysystem='fita')or((archerysystem='follow')and((followsystem='0')or(followsystem='1'))))and ((Turnsperserie >1) and
  ((Shooter1.Caption='C') and (turnnumber=1) and (Archersperturn=1)) or ((Shooter1.Caption='C') and (turnnumber=1) and (Archersperturn=2)) or  ((Shooter2.Caption='C') and (turnnumber=2) and(Archersperturn=1)) or ((Shooter3.Caption='C') and (turnnumber=3 )and(Archersperturn=1)) or ((Shooter3.Caption='C') and (turnnumber=2 )and(Archersperturn=2)) or ((Shooter3.Caption='C') and (turnnumber=1 )and(Archersperturn=3))  or ((Shooter4.Caption='C') and (turnnumber=4) and (Archersperturn=1))or ((Shooter5.Caption='C') and (turnnumber=5) and(Archersperturn=1)) or ((Shooter5.Caption='C') and (turnnumber=3) and(Archersperturn=2)) or ((Shooter6.Caption='C') and (turnnumber=6)and(Archersperturn=1)) or ((Shooter6.Caption='C') and (turnnumber=2)and(Archersperturn=3)) ))
  or ((((Shootoff=0)and(archerysystem='25m1p'))or((archerysystem='follow')and(followsystem='3')))and (shooteronearrownr.caption='3')and (abcd25m1p.checked=true))  then
  begin
    LampC_on_off:=1;
    Not_LampC_on_off:=0;

  end
  else
  begin
    LampC_on_off:=0;
    if (Turnsperserie * Archersperturn >2) then Not_LampC_on_off:=1 else Not_LampC_on_off:=0;

  end;
  if  (((Shootoff=0)and(archerysystem='fita')or((archerysystem='follow')and((followsystem='0')or(followsystem='1'))))and ((Turnsperserie >1) and
  ((Shooter1.Caption='D') and (turnnumber=1)and(Archersperturn=1)) or ((Shooter1.Caption='D') and (turnnumber=1)and(Archersperturn=3)) or ((Shooter2.Caption='D') and (turnnumber=2) and(Archersperturn=1)) or ((Shooter2.Caption='D') and (turnnumber=1) and(Archersperturn=2)) or ((Shooter3.Caption='D') and  (turnnumber=3 )and(Archersperturn=1)) or ((Shooter4.Caption='D') and (turnnumber=4) and (Archersperturn=1)) or ((Shooter4.Caption='D') and (turnnumber=2) and (Archersperturn=2)) or ((Shooter4.Caption='D') and (turnnumber=2) and (Archersperturn=3)) or ((Shooter5.Caption='D') and (turnnumber=5) and(Archersperturn=1)) or ((Shooter6.Caption='D') and (turnnumber=6)and(Archersperturn=1)) or ((Shooter6.Caption='D') and (turnnumber=3)and(Archersperturn=2))))
  or ((((Shootoff=0)and(archerysystem='25m1p'))or((archerysystem='follow')and(followsystem='3')))and (shooteronearrownr.caption='4')and (abcd25m1p.checked=true)) then
  begin
    LampD_on_off:=1;
    Not_LampD_on_off:=0;

  end
  else
  begin
    LampD_on_off:=0;
    if (Turnsperserie * Archersperturn>3) then Not_LampD_on_off:=1 else Not_LampD_on_off:=0;
  end;

  if  (((Shootoff=0)and(archerysystem='fita')or((archerysystem='follow')and((followsystem='0')or(followsystem='1'))))and ((Turnsperserie >1) and
  ((Shooter1.Caption='E') and (turnnumber=1)and(Archersperturn=1)) or ((Shooter1.Caption='E') and (turnnumber=1)and(Archersperturn=2)) or ((Shooter2.Caption='E') and (turnnumber=2)and(Archersperturn=1)) or ((Shooter2.Caption='E') and (turnnumber=1)and(Archersperturn=3)) or ((Shooter3.Caption='E') and (turnnumber=3) and (Archersperturn=1)) or ((Shooter3.Caption='E') and (turnnumber=2) and (Archersperturn=2)) or ((Shooter4.Caption='E') and (turnnumber=4) and (Archersperturn=1)) or ((Shooter5.Caption='E') and (turnnumber=5) and(Archersperturn=1)) or ((Shooter5.Caption='E') and (turnnumber=3) and(Archersperturn=2)) or ((Shooter5.Caption='E') and (turnnumber=2) and(Archersperturn=3))  or ((Shooter6.Caption='E') and (turnnumber=6)and(Archersperturn=1)) ))
  or ((((Shootoff=0)and(archerysystem='25m1p'))or((archerysystem='follow')and(followsystem='3')))and (shooteronearrownr.caption='5')and (abcd25m1p.checked=true))  then
  begin
    LampE_on_off:=1;
    Not_LampE_on_off:=0;

  end
  else
  begin
    LampE_on_off:=0;
    if (Turnsperserie * Archersperturn >4) then Not_LampE_on_off:=1 else Not_LampE_on_off:=0;

  end;
  if  (((Shootoff=0)and(archerysystem='fita')or((archerysystem='follow')and((followsystem='0')or(followsystem='1'))))and ((Turnsperserie >1) and
  ((Shooter1.Caption='F') and (turnnumber=1)and( Archersperturn=1)) or ((Shooter2.Caption='F') and (turnnumber=2)and( Archersperturn=1)) or ((Shooter2.Caption='F') and (turnnumber=1)and( Archersperturn=2)) or ((Shooter3.Caption='F') and (turnnumber=3) and (Archersperturn=1)) or ((Shooter3.Caption='F') and (turnnumber=1) and (Archersperturn=3)) or ((Shooter4.Caption='F') and (turnnumber=4)and(Archersperturn=1)) or ((Shooter4.Caption='F') and (turnnumber=2)and(Archersperturn=2)) or ((Shooter5.Caption='F') and (turnnumber=5)and(Archersperturn=1)) or ((Shooter6.Caption='F') and (turnnumber=6)and(Archersperturn=1)) or ((Shooter6.Caption='F') and (turnnumber=3)and(Archersperturn=2)) or ((Shooter6.Caption='F') and (turnnumber=2)and(Archersperturn=3))))
  or ((((Shootoff=0)and(archerysystem='25m1p'))or((archerysystem='follow')and(followsystem='3')))and (shooteronearrownr.caption='6')and (abcd25m1p.checked=true)) then
  begin
    LampF_on_off:=1;
    Not_LampF_on_off:=0;

  end
  else
  begin
    LampF_on_off:=0;
    if (Turnsperserie * Archersperturn>5) then Not_LampF_on_off:=1 else Not_LampF_on_off:=0;
  end;





  countdowntostart.Caption:=(CurrToStr(tostart.value)+ ' '+Minabr);   //show the correct number of minutes next to countdownbefore start icon. Number is in the settings menu
  if (showhints.checked=true) and(((state <> 2) and (archerysystem<>'fitafin')and (archerysystem<>'manual') and (archerysystem<>'follow'))or((archerysystem='fitafin')and(fitafinarcher<>'none'))) then nexthelp.Visible:=true else nexthelp.Visible:=false;   //show help text for next button  depending on menu setting and state
  if (showhints.checked=true) and (state = 1) and (archerysystem='fitafin') and (fitafinarcher='none') then chooselabel.Visible:=true else chooselabel.Visible:=false;                              //show help text for choose button  depending on menu setting and state
  if (archerysystem='fitafin')and (fitafinarcher='none') and  (state = 1) then nexticon.visible:=false else               // if the choise is not made if left or right archer starts, it is not possible to press next. so icon is invisible
  begin
    if ((hideicons.checked = false) and (archerysystem<>'manual') and (archerysystem<>'follow')) then nexticon.visible:=true;
  end;
  if (state = 2) and ((archerysystem<>'fita') or (redtime.Value<>-1)) then
  begin     //during red state   the next button is invisible because timer is already started and it is not possible tha all archers are ready because they couldn't shoot yet
    nexticon.visible:=false;
    nexthelp.Visible:=false;
  end;

  if archerysystem<>'fitafin'then // set correct help labels
  begin
    turndown.hint:=prevarch;
    turnup.hint:=nextarch;
  end
  else
  begin
    turndown.hint:=selectleft;
    turnup.hint:=selectright;
  end;
  //set the correct hint on next button depending on state
  if (state=1) or (state=5) then
  begin
    nexticon.Hint:= NXTstart;
    nexthelp.Caption:= Mainhint1;
  end;
  If state=2 then nexticon.Hint:='';
  If (state=3) or (state=4) then
  begin
    if (archerysystem<>'fitafin') then
    begin
      if (((turnnumber =turnsperserie) and (serienumber mod turnsss =0)) or (Shootoff=1)) then
      begin
        nexticon.Hint:=NXTstop;
        nexthelp.Caption:= Mainhint4;
      end
      else
      begin
        nexticon.Hint:= NXTnext;
        nexthelp.Caption:= Mainhint3;
      end;
    end
    else
    begin
      if ((((serienumber>=finalturns.value) and (timeperturn.checked=true))or((serienumber>=finalteamturns.Value) and (timeperturn.checked=false)) )and(((fitafinarcher='right') and (fitafinstartarcher = 'left')  )or ((fitafinarcher='left') and (fitafinstartarcher = 'right'))))then
      begin
        nexticon.Hint:=NXTstop;
        nexthelp.Caption:= Mainhint4;
      end
      else
      begin
        nexticon.Hint:= NXTnext;
        nexthelp.Caption:= Mainhint3;
      end;
    end;


  end;
  if CardAddr=0 then   //only if k8055 is used, the option to choose BCD lights is visible because K8055 has only 8 outputs. So it is not possible to stear 6 trafic lights and 4 ABSD signs. And ABCD is not used during final rounds
  begin
    BCDtoROG2.Visible:=true;
    BCDtoROG2label.Visible:=true;
  end
  else
  begin
    BCDtoROG2.Visible:=false;
    BCDtoROG2label.Visible:=false;
  end;

  switchbox;   //switch the external hardware (lamps, digits etc)

  TLswitch;  //to switch the TraficLights on the sceen (If applicable)

end;


Procedure TCountdownform.switchbox;
var i,j,k,l,l2,m,n,atype,stype,extshooter1,extshooter2,extshooter3,extshooter4,extshooter5,extshooter6,leftend,midend,rightend,bit15,bit16,zerotwelve1,zerotwelve2,zerotwelve3,shtrs:longint;

  (*
  this procedure is used to switch the external hardware. Two possibilities (at this moment) the K8055 and related interface boards from Velleman. or USB/serial
  K8055 has only the possibility to switch 8 output channnels (and 2 annalog channels can be used as digital channel)

  USB serial is commonly used with arduino, but can also be used with other serial or USB interface boards.
  Protocoll: 16 bits strings where the first 2 digits of the string is the adres (destination)
  -if 1st bit is '1' means "trafic light data". The information of the other bits is about trafic lights (red orange green), ABCD lights and buzzer
    -if 2nd bit is '0' means bit 3 is buzzer, 4 to 6 is green orange and red light on right side (right side archer). Bit 7 to 9 is green orange and red light on left side. Bit 10 to 15 is ABCDEF light.
    -if 2nd bit is '1' is not yet implemented yet. Ment to use sequence of ABCD. 4 positions are sent where 3 bits per archer tel if it is A, B, C, D, blank, +, or -
       -if 3rd and 4th bit is '00' then Details about ABCD positionsin sequence (bit 5,6 and 7 pos1. bit 8,9 and 10 pos2. bit 11,12 and 13 pos3. bit 14, 15 and 16 pos 4.
       -if 3rd and 4th bit is '01' then:Details about EF positionsin sequence (bit 5,6 and 7 pos5. bit 8,9 and 10 pos6.
       -if 3rd and 4th bit is '10' then: end nr. 5-8 left bit, 9-12 mid bit, 13-16 right bit. 1111 is P (practise)
       -if 3rd and 4th bit is '11' then: state details. Bit 5,6,7,8 for state.  bit 9 and up archerytype(Fita, fitafinals, etc)
  -if 1st bit is '0' means "Digits data". The information of the other bits is about the digits of the countdown (nr of seconds)
    -if 2nd + 3rd bit is '00' means digits on leftside (left side archer) are in the string in bit 4 to 16
    -if 2nd + 3rd bit is '10' means digits on rightside (right side archer) are in the string in bit 4 to 16
    -if 2nd + 3rd bit is '*1' means digits for both sides are in the string in bit 4 to 16 (no alternating round)
    -bit 4 to 16:
      -bit 4 indicates minute or seconds notation (Two dots are needed between left and middle digits
      -bit 5 to 8 is left digit (minutes or 100 seconds)
      -bit 9 to 12 is middle digit (10 seconds)
      -bit 13 to 16 is right digits (10 secondes)
  *)
begin
{$IFDEF Windows}     //K8055 is only for windows at the moment

  if (archerysystem='fitafin')and ((BCDtoROG2.checked=true)) then      //final rounds. Because the check box "BCDtoROG2" is checked, the B, C and D outputs are used for red, orange and green lamp on right side.
  begin

    i:=buzzeron*1+
    lamp_red_left_on_off*2+
    lamp_orange_left_on_off*4+
    lamp_green_left_on_off*8+
    lamp_red_right_on_off*32+
    lamp_orange_right_on_off*64+
    lamp_green_right_on_off*128;
    if not DisableOtherFunctionCall then WriteAllDigital(i);
    OutputAnalogChannel(1,0);
    OutputAnalogChannel(2,0);

  end
  else
  begin
    if (archerysystem='fitafin')then
    begin
    if viewleft.Checked=true then
    begin
      i:=buzzeron*1+
      lamp_red_left_on_off *2+
      lamp_orange_left_on_off *4+
      lamp_green_left_on_off *8+
      LampA_on_off*16+
      LampB_on_off*32+
      LampC_on_off*64+
      LampD_on_off*128;

    end;
    if viewright.Checked=true then
    begin
      i:=buzzeron*1+
      lamp_red_right_on_off *2+
      lamp_orange_right_on_off *4+
      lamp_green_right_on_off *8+
      LampA_on_off*16+
      LampB_on_off*32+
      LampC_on_off*64+
      LampD_on_off*128;

    end;

    end
    else
   // OutputAnalogChannel(1,0);
    i:=buzzeron*1+
    (lamp_red_left_on_off and lamp_red_right_on_off)*2+
    (lamp_orange_left_on_off or lamp_orange_right_on_off)*4+
    (lamp_green_left_on_off or lamp_green_right_on_off)*8+
    LampA_on_off*16+
    LampB_on_off*32+
    LampC_on_off*64+
    LampD_on_off*128;
    if (not DisableOtherFunctionCall) and (rememberK8055i<>i)  then WriteAllDigital(i);
    if (rememberK8055E<>LampE_on_off) then if (LampE_on_off=1) then OutputAnalogChannel(1,255)  else  OutputAnalogChannel(1,0);
    if (rememberK8055F<>LampF_on_off) then if (LampF_on_off=1) then OutputAnalogChannel(2,255)  else  OutputAnalogChannel(2,0);
    rememberK8055i:=i;
    rememberK8055E:=LampE_on_off;
    rememberK8055F:=LampF_on_off;
  end;

{$ENDIF}

// USB/serial (arduino)   and network

  if(archerysystem='fitafin') or (archerysystem='manual') then archerspertarget:=0 else if (Turnsperserie * Archersperturn)<=4 then archerspertarget:= ((Turnsperserie * Archersperturn)-1) else archerspertarget:=3 ;   //kan weg?

  if (archerysystem='fitafin') then
  begin
    if fitafinarcher='right' then bit15 :=1 else bit15:=0;
    if fitafinarcher='left' then bit16 :=1 else bit16:=0;

  end
  else
  begin
    bit15 :=LampE_on_off;
    bit16 :=LampF_on_off;
  end;
  i:=

  1 shl 0+ //trafic light data (not digits)
  0 shl 1+ // 0 is standard red orange green and ABCD. (No ABCD sequence details
  0 shl 2+ // open for usage in future
  buzzeron shl 3+
  lamp_green_right_on_off shl 4+
  lamp_orange_right_on_off shl 5+
  lamp_red_right_on_off shl 6+
  lamp_green_left_on_off shl 7+
  lamp_orange_left_on_off shl 8+
  lamp_red_left_on_off shl 9+
  LampA_on_off shl 10+
  LampB_on_off shl 11+
  LampC_on_off shl 12+
  LampD_on_off shl 13+
 // archerspertarget shl 14    //Number af archers per target. (sent for old config ledscreens 0-3 (max 4 archers))
//  LampE_on_off shl 14+
//  LampF_on_off shl 15
  bit15 shl 14+
  bit16 shl 15

 ;
  SENTLAN1:=i;
  if practiseturn = 1 then leftend:=15 else if ((serienumber mod 1000)div 100)=0 then leftend:=14 else leftend:=((serienumber mod 1000)div 100);
  if ((((serienumber mod 100)div 10)=0)and (((serienumber mod 1000)div 100)=0)) then midend:=14 else midend:= ((serienumber mod 100)div 10);
  rightend:=   (serienumber mod 10);

  if leftend=0 then zerotwelve1:=12 else zerotwelve1:=leftend;
  if midend=0 then zerotwelve2:=12 else zerotwelve2:=midend;
  if rightend=0 then zerotwelve3:=12 else zerotwelve3:=rightend;


  m:=
  1 shl 0+ //trafic light data (not digits)
  1 shl 1+ // 1 is sequence details
  1 shl 2+ // end nr details
  0 shl 3+ // open for usage in future
  zerotwelve1 shl 4+   //practise turn or normal turn
  zerotwelve2 shl 8+
  zerotwelve3 shl 12
  ;
  SENTLAN5:=m;

  atype:=0;
  stype:=state;
  if alarmstate=1 then stype:= 6;
  if (archerysystem='fita') AND NOT(showABCD)then atype:=0;
  if (archerysystem='fita') AND (showABCD)then atype:=1;
  if archerysystem='fitafin'then atype:=2;
  if archerysystem='25m1p'then atype:=3;
  if archerysystem='manual'then atype:=4;
  if archerysystem='follow'then atype:=5;
  shtrs:=Shooters-1;
  n:=
  1 shl 0+ //trafic light data (not digits)
  1 shl 1+ // 1 is sequence details
  1 shl 2+ // state details
  1 shl 3+ // state details
  stype shl 4 +
  atype shl 7 +
  turnnumber shl 10 +
  shtrs shl 13;    //Number af archers per target.
  SENTLAN6:=n;
  extshooter1:=0;
  extshooter2:=3;
  extshooter3:=0;
  extshooter4:=0;

  if archerysystem='fita' then
  begin
    begin
      if (shooter1.Caption='A') then extshooter1:=1;
      if (shooter1.Caption='B') then extshooter1:=2;
      if (shooter1.Caption='C') then extshooter1:=3;
      if (shooter1.Caption='D') then extshooter1:=4;
      if (shooter1.Caption='E') then extshooter1:=5;
      if (shooter1.Caption='F') then extshooter1:=6;
    end;
    begin
      if (shooter2.Caption='A') then extshooter2:=1;
      if (shooter2.Caption='B') then extshooter2:=2;
      if (shooter2.Caption='C') then extshooter2:=3;
      if (shooter2.Caption='D') then extshooter2:=4;
      if (shooter2.Caption='E') then extshooter2:=5;
      if (shooter2.Caption='F') then extshooter2:=6;
    end;
    begin
      if (shooter3.Caption='A') then extshooter3:=1;
      if (shooter3.Caption='B') then extshooter3:=2;
      if (shooter3.Caption='C') then extshooter3:=3;
      if (shooter3.Caption='D') then extshooter3:=4;
      if (shooter3.Caption='E') then extshooter3:=5;
      if (shooter3.Caption='F') then extshooter3:=6;
    end;
    begin
      if (shooter4.Caption='A') then extshooter4:=1;
      if (shooter4.Caption='B') then extshooter4:=2;
      if (shooter4.Caption='C') then extshooter4:=3;
      if (shooter4.Caption='D') then extshooter4:=4;
      if (shooter4.Caption='E') then extshooter4:=5;
      if (shooter4.Caption='F') then extshooter4:=6;
    end;
    begin
      if (shooter5.Caption='A') then extshooter5:=1;
      if (shooter5.Caption='B') then extshooter5:=2;
      if (shooter5.Caption='C') then extshooter5:=3;
      if (shooter5.Caption='D') then extshooter5:=4;
      if (shooter5.Caption='E') then extshooter5:=5;
      if (shooter5.Caption='F') then extshooter5:=6;
    end;
    begin
      if (shooter6.Caption='A') then extshooter6:=1;
      if (shooter6.Caption='B') then extshooter6:=2;
      if (shooter6.Caption='C') then extshooter6:=3;
      if (shooter6.Caption='D') then extshooter6:=4;
      if (shooter6.Caption='E') then extshooter6:=5;
      if (shooter6.Caption='F') then extshooter6:=6;
    end;

  end;
  if archerysystem='25m1p' then
  begin
    extshooter1:=turnnumber;
  end;
  if (archerysystem<>'fita') then
  begin
    l:=

    1 shl 0+ //trafic light data (not digits)
    1 shl 1+ // is sequence details
    0 shl 2+ // 0 is ABCD sequence details
    0 shl 3+ // 0 is ABCD sequence details
    0 shl 4+
    5 shl 7+
    2 shl 10+
    5 shl 13
   ;
    l2:=

    1 shl 0+ //trafic light data (not digits)
    1 shl 1+ // is sequence details
    0 shl 2+ // 0 is ABCD sequence details
    1 shl 3+ // 1 is EF sequence details
    0 shl 4+
    5 shl 7+
    2 shl 10+
    5 shl 13
   ;

  end
  else
  begin
   l:=

   1 shl 0+ //trafic light data (not digits)
   1 shl 1+ // is sequence details
   0 shl 2+ // 0 is ABCDEF sequence details
   0 shl 3+ // 0 is ABCD sequence details
   extshooter1 shl 4+
   extshooter2 shl 7+
   extshooter3 shl 10+
   extshooter4 shl 13
  ;
   l2:=

   1 shl 0+ //trafic light data (not digits)
   1 shl 1+ // is sequence details
   0 shl 2+ // 0 is ABCDEF sequence details
   1 shl 3+ // 1 is EF sequence details
   extshooter5 shl 4+
   extshooter6 shl 7

  ;

  end;
  SENTLAN4:=l;
  SENTLAN4b:=l2;
  if (archerysystem='fitafin') then
  begin
    if state<>1 then
    begin
      if StrToInt(digit1_1.Caption)=0 then zerotwelve1:=12 else zerotwelve1:=StrToInt(digit1_1.Caption);
      if StrToInt(digit2_1.Caption)=0 then zerotwelve2:=12 else zerotwelve2:=StrToInt(digit2_1.Caption);
      if StrToInt(digit3_1.Caption)=0 then zerotwelve3:=12 else zerotwelve3:=StrToInt(digit3_1.Caption);

      begin
        j:=      //left archer
        0 shl 0+ //digits data (not trafic lights)
        0 shl 1+ //leftside
        0 shl 2+ //0 leftright are different beause its a final round
        minsec.ItemIndex shl 3+ //Minutes or sec indication (to indicate if dots are needed
        zerotwelve3 shl 4+
        zerotwelve2 shl 8+
        zerotwelve1 shl 12  ;  (*  *)
      end;
      begin

      end;

      if StrToInt(digit1_2.Caption)=0 then zerotwelve1:=12 else zerotwelve1:=StrToInt(digit1_2.Caption);
      if StrToInt(digit2_2.Caption)=0 then zerotwelve2:=12 else zerotwelve2:=StrToInt(digit2_2.Caption);
      if StrToInt(digit3_2.Caption)=0 then zerotwelve3:=12 else zerotwelve3:=StrToInt(digit3_2.Caption);


      begin
        k:=      //right archer
        0 shl 0+ //digits data (not trafic lights)
        1 shl 1+ //rightside
        0 shl 2+ //0 leftright are different beause its a final round
        minsec.ItemIndex shl 3+ //Minutes or sec indication (to indicate if dots are needed
        zerotwelve3 shl 4+
        zerotwelve2 shl 8+
        zerotwelve1 shl 12 ;
      end ;
      begin

      end;
    end
    else
    begin
        j:=      //left archer
        0 shl 0+ //digits data (not trafic lights)
        0 shl 1+ //leftside
        0 shl 2+ //0 leftright are different beause its a final round
        minsec.ItemIndex shl 3+ //Minutes or sec indication (to indicate if dots are needed
        10 shl 4 + 10 shl 8 +10 shl 12;

        k:=      //right archer
        0 shl 0+ //digits data (not trafic lights)
        1 shl 1+ //rightside
        0 shl 2+ //0 leftright are different beause its a final round
        minsec.ItemIndex shl 3+ //Minutes or sec indication (to indicate if dots are neded)    no dots when dashes
        10 shl 4 + 10 shl 8 +10 shl 12;
    end;
    SENTLAN2:=j;
    SENTLAN3:=k;

  end
  else
  begin
    if (state<>1) and (state<>5) and (archerysystem<>'manual') then
    begin


      if StrToInt(digit1_1.Caption)=0 then zerotwelve1:=12 else zerotwelve1:=StrToInt(digit1_1.Caption);
      if StrToInt(digit2_1.Caption)=0 then zerotwelve2:=12 else zerotwelve2:=StrToInt(digit2_1.Caption);
      if StrToInt(digit3_1.Caption)=0 then zerotwelve3:=12 else zerotwelve3:=StrToInt(digit3_1.Caption);


      j:=
      0 shl 0+ //digits data (not trafic lights)
      1 shl 1+ //leftright doesn't matter since leftright are the same
      1 shl 2+ //1 because left and right side are the same. (not a final round)
      minsec.ItemIndex shl 3+  //Minutes or sec indication (to indicate if dots are needed

      zerotwelve3 shl 4+
      zerotwelve2 shl 8+
      zerotwelve1 shl 12 ;
    end;
    if (state<>1) and (state=5) and (archerysystem<>'manual') then
    begin
      if StrToInt(digit1_3.Caption)=0 then zerotwelve1:=12 else zerotwelve1:=StrToInt(digit1_3.Caption);
      if StrToInt(digit2_3.Caption)=0 then zerotwelve2:=12 else zerotwelve2:=StrToInt(digit2_3.Caption);
      if StrToInt(digit3_3.Caption)=0 then zerotwelve3:=12 else zerotwelve3:=StrToInt(digit3_3.Caption);


      j:=
      0 shl 0+ //digits data (not trafic lights)
      1 shl 1+ //leftright doesn't matter since leftright are the same
      1 shl 2+ //1 because left and right side are the same. (not a final round)
      1 shl 3+  //precount is always minutes indication

      zerotwelve3 shl 4+
      zerotwelve2 shl 8+
      zerotwelve1 shl 12;
    end;
    if (state =1) or (archerysystem = 'manual') then
    j:=
    0 shl 0+ //digits data (not trafic lights)
    1 shl 1+ //leftright doesn't matter since leftright are the same
    1 shl 2+ //1 because left and right side are the same. (not a final round)
    minsec.ItemIndex shl 3+  //Minutes or sec indication (to indicate if dots are needed ) no dots when dashes
    10 shl 4 + 10 shl 8 +10 shl 12;


    K:= j;
    SENTLAN2:=j;
    SENTLAN3:=k;

  end;
 begin


  if (l<>arduinowrite4) or (justconnected=true) then
  begin
    if arduinoselect1.Checked=true then
    begin

    end;

    if  (LANselect.Checked=true) then
    begin


    end;
   end;
 end;

 justconnected:=false;
end;
procedure TCountdownform.connectports;
begin
  getPCname;
  NETWORK1.Disconnect;
  if (archerysystem<>'follow' ) then
  Begin


    followtimer.Enabled:=false;
   if ((Lanselect.Checked=true) ) then
    begin
      networktimestamp.Enabled:=true;
      NETWORK1.Listen(portnumber1.Value);
   end
    else
    begin
       networktimestamp.Enabled:=false;
    end;
  end
  else
  begin
    if LANinput.Checked=true then
    begin
      NETWORK1.Connect(fromHOST.Text, portnumber1.Value);
      followtimer.Enabled:=true;
    end
    else
    followtimer.Enabled:=false;
    networktimestamp.Enabled:=false;
    if LANinput.Checked=true then NETWORK1.SendMessage('CON'+HOSTNAME.Caption);
  end;

end;

procedure TCountdownform.getPCname;
var n: Integer;
    PCNameBuffer: array[0..255] of char;
    PCBuffer: DWord;
Begin
  PCBuffer := 256;
  {$IFDEF Windows}
  getComputerName(PCNameBuffer, PCBuffer);

  HOSTNAME.caption:=string(PCNameBuffer);
  {$ENDIF}
  {$IFDEF Unix}
  HOSTNAME.caption:=GetHostName;

  {$ENDIF}
end;


procedure TCountdownform.resizewindowfinals;  //change  items on the screen depending on screensize during final (alternating) round
begin

  finalchoose.Width:=trunc ((referencesize*0.10)*mag);
  finalchoose.constraints.minwidth:=trunc ((referencesize*0.10));
  finalchoose.height:=trunc ((referencesize*0.04)*mag);
  finalchoose.top:=(trunc (referencesize*0.58)+topmarge);
  finalchoose.left:=trunc (leftmarge+((referencesize*0.45)));
  finalchoose.Font.Height:=trunc ((referencesize*0.03)*mag);

  rightstart.Width:=trunc ((referencesize*0.10)*mag);
  rightstart.constraints.minwidth:=trunc ((referencesize*0.10));
  rightstart.height:=trunc ((referencesize*0.04)*mag);
  rightstart.top:=(trunc (referencesize*0.58)+topmarge);
  rightstart.left:=trunc (leftmarge+((referencesize*0.55)));
  rightstart.Font.Height:=trunc ((referencesize*0.02)*mag);

  leftstart.Width:=trunc ((referencesize*0.10)*mag);
  leftstart.constraints.minwidth:=trunc ((referencesize*0.10));
  leftstart.height:=trunc ((referencesize*0.04)*mag);
  leftstart.top:=(trunc (referencesize*0.58)+topmarge);
  leftstart.left:=trunc (leftmarge+((referencesize*0.35)));
  leftstart.Font.Height:=trunc ((referencesize*0.02)*mag);

  serienr.Top:=(trunc (referencesize*0.4)+topmarge);
  serienr.Left:=(trunc (referencesize*0.37)+leftmarge);
  serienr.Font.height:=trunc ((referencesize*0.2)*mag);
  serienr.Width:=trunc ((referencesize*0.25)*mag);
  serienr.constraints.minwidth:=trunc ((referencesize*0.25));
  serienr.height:=trunc ((referencesize*0.2)*mag);
  archeryclock.top:=(trunc (referencesize*0.02)+topmarge) ;
  emergencytext.top:=(trunc (referencesize*0.025)+topmarge) ;

    if finarrow.Checked=true then
    begin
      digit1_1.Constraints.maxheight:=trunc (((referencesize*0.4)-(referencesize*leftscale*0.002)));
      digit1_1.Font.Height:= trunc (((referencesize*0.45)-(referencesize*leftscale*0.00225))*mag);
      digit1_1.Height:=trunc (((referencesize*0.4)-(referencesize*leftscale*0.002))*mag);
      digit1_1.Top:=(trunc ((referencesize*-0.05*mag*mag*mag)+(referencesize*leftscale*0.0038))+topmarge);

      digit1_2.Constraints.maxheight:=trunc (((referencesize*0.4)-(referencesize*rightscale*0.002)));
      digit1_2.Font.Height:= trunc (((referencesize*0.45)-(referencesize*rightscale*0.00225))*mag);
      digit1_2.Height:=trunc (((referencesize*0.4)-(referencesize*rightscale*0.002))*mag);
      digit1_2.Top:=(trunc ((referencesize*-0.05*mag*mag*mag)+(referencesize*rightscale*0.0038))+topmarge);


      digit2_1.Constraints.maxheight:=trunc (((referencesize*0.4)-(referencesize*leftscale*0.002)));
      digit2_1.Font.Height:= trunc (((referencesize*0.45)-(referencesize*leftscale*0.00225))*mag);
      digit2_1.Height:=trunc (((referencesize*0.4)-(referencesize*leftscale*0.002))*mag);
      digit2_1.Top:=(trunc ((referencesize*-0.05*mag*mag*mag)+(referencesize*leftscale*0.0038))+topmarge);

      digit2_2.Constraints.maxheight:=trunc (((referencesize*0.4)-(referencesize*rightscale*0.002)));
      digit2_2.Font.Height:= trunc (((referencesize*0.45)-(referencesize*rightscale*0.00225))*mag);
      digit2_2.Height:=trunc (((referencesize*0.4)-(referencesize*rightscale*0.002))*mag);
      digit2_2.Top:=(trunc ((referencesize*-0.05*mag*mag*mag)+(referencesize*rightscale*0.0038))+topmarge);

      digit3_1.Constraints.maxheight:=trunc (((referencesize*0.4)-(referencesize*leftscale*0.002)));
      digit3_1.Font.Height:= trunc (((referencesize*0.45)-(referencesize*leftscale*0.00225))*mag);
      digit3_1.Height:=trunc (((referencesize*0.4)-(referencesize*leftscale*0.002))*mag);
      digit3_1.Top:=(trunc ((referencesize*-0.05*mag*mag*mag)+(referencesize*leftscale*0.0038))+topmarge);

      digit3_2.Constraints.maxheight:=trunc (((referencesize*0.4)-(referencesize*rightscale*0.002)));
      digit3_2.Font.Height:= trunc (((referencesize*0.45)-(referencesize*rightscale*0.00225))*mag);
      digit3_2.Height:=trunc (((referencesize*0.4)-(referencesize*rightscale*0.002))*mag);
      digit3_2.Top:=(trunc ((referencesize*-0.05*mag*mag*mag)+(referencesize*rightscale*0.0038))+topmarge);

      dots_1.Font.Height:= trunc (((referencesize*0.29)-(referencesize*leftscale*0.00145))*mag);
      dots_1.Height:=trunc (((referencesize*0.29)-(referencesize*leftscale*0.00145))*mag);
      dots_1.Constraints.maxheight:=trunc(((referencesize*0.29)-(referencesize*leftscale*0.00145)));
      dots_1.Top:=(trunc ((referencesize*+0.02*mag*mag*mag)+(referencesize*leftscale*0.00345))+topmarge);

      dots_2.Font.Height:= trunc (((referencesize*0.29)-(referencesize*rightscale*0.00145))*mag);
      dots_2.Height:=trunc (((referencesize*0.29)-(referencesize*rightscale*0.00145))*mag);
      dots_2.Constraints.maxheight:=trunc(((referencesize*0.29)-(referencesize*rightscale*0.00145)));
      dots_2.Top:=(trunc ((referencesize*+0.02*mag*mag*mag)+(referencesize*rightscale*0.00345))+topmarge);



      if seconds.Checked=true then
      begin
        digit1_1.Left:= (trunc ((referencesize*0.046)-(referencesize*leftscale*0.00016))+leftmarge);
        digit2_1.Left:= (trunc ((referencesize*0.294)-(referencesize*leftscale*0.00144))+leftmarge);
        digit3_1.Left:= (trunc ((referencesize*0.542)-(referencesize*leftscale*0.00272))+leftmarge);

        digit1_2.Left:= (trunc ((referencesize*0.236)+(referencesize*rightscale*0.00380))+leftmarge);
        digit2_2.Left:= (trunc ((referencesize*0.484)+(referencesize*rightscale*0.00260))+leftmarge);
        digit3_2.Left:= (trunc ((referencesize*0.732)+(referencesize*rightscale*0.00140))+leftmarge);

        dots_1.Visible:=false;
        dots_2.Visible:=false;

      end
      else
      begin
        digit1_1.Left:= (trunc ((referencesize*0.0008)-(referencesize*leftscale*0.000008))+leftmarge);
        dots_1.Left:= (trunc ((referencesize*0.232)-(referencesize*leftscale*0.00115))+leftmarge);
        digit2_1.Left:= (trunc ((referencesize*0.304)-(referencesize*leftscale*0.00152))+leftmarge);
        digit3_1.Left:= (trunc ((referencesize*0.544)-(referencesize*leftscale*0.00272))+leftmarge);

        digit1_2.Left:= (trunc ((referencesize*0.1888)+(referencesize*rightscale*0.00412))+leftmarge);
        dots_2.Left:= (trunc ((referencesize*0.42)+(referencesize*rightscale*0.00295))+leftmarge);
        digit2_2.Left:= (trunc ((referencesize*0.492)+(referencesize*rightscale*0.00260))+leftmarge);
        digit3_2.Left:= (trunc ((referencesize*0.732)+(referencesize*rightscale*0.00140))+leftmarge);
        dots_1.Visible:=true;
        dots_2.Visible:=true;

      end;




    end
    else
    begin
      resizewindownonfinals;

    end;

    lefttarget.Font.Height:=trunc ((referencesize*0.12)*mag);
    lefttarget.Width:=trunc ((referencesize*0.12)*mag);
    lefttarget.constraints.minwidth:=trunc ((referencesize*0.12));
    lefttarget.height:=trunc ((referencesize*0.12)*mag);
    lefttarget.top:=(trunc (referencesize*0.52)+topmarge);
    lefttarget.left:=(trunc (referencesize*0.001)+leftmarge);

    righttarget.Font.Height:=trunc ((referencesize*0.12)*mag);
    righttarget.Width:=trunc ((referencesize*0.12)*mag);
    righttarget.constraints.minwidth:=trunc ((referencesize*0.12));
    righttarget.height:=trunc ((referencesize*0.12)*mag);
    righttarget.top:=(trunc (referencesize*0.52)+topmarge);
    righttarget.left:=(trunc (referencesize*0.88)+leftmarge);




end;

procedure TCountdownform.resizewindownonfinals;    //change  items on the screen depending on screensize during regular match (not alternating)
var pitch, pshift, psize, ptop:real;
begin
    digit1_1.Constraints.maxheight:=trunc ((referencesize*0.5));
    digit1_1.Font.Height:= trunc ((referencesize*0.57)*mag);
    digit1_1.Height:=trunc ((referencesize*0.5)*mag);
    digit1_1.Top:=(trunc (referencesize*-0.07*mag*mag*mag)+topmarge);

    digit2_1.Constraints.maxheight:=trunc ((referencesize*0.5));
    digit2_1.Font.Height:= trunc ((referencesize*0.57)*mag);
    digit2_1.Height:=trunc ((referencesize*0.5)*mag);
    digit2_1.Top:=(trunc (referencesize*-0.07*mag*mag*mag)+topmarge);

    digit3_1.Constraints.maxheight:=trunc ((referencesize*0.5));
    digit3_1.Font.Height:= trunc ((referencesize*0.57)*mag);
    digit3_1.Height:=trunc ((referencesize*0.5)*mag);
    digit3_1.Top:=(trunc (referencesize*-0.07*mag*mag*mag)+topmarge);


    dots_1.Constraints.maxheight:=trunc((referencesize*0.36));

    dots_1.Height:=trunc ((referencesize*0.36)*mag);
    dots_1.Font.Height:= trunc ((referencesize*0.36*mag));
    dots_1.Top:=(trunc (referencesize*+0.03*mag*mag*mag)+topmarge);
    if seconds.Checked=true then     //horizontal position is different if minute notation is used because of extra dots_1.
    begin
      digit1_1.Left:= (trunc (referencesize*0.02)+leftmarge);
      digit2_1.Left:= (trunc (referencesize*0.33)+leftmarge);
      digit3_1.Left:= (trunc (referencesize*0.64)+leftmarge);
      dots_1.Visible:=false;
    end
    else
    begin
      digit1_1.Left:= (trunc (referencesize*0.001)+leftmarge);
      dots_1.Left:= (trunc (referencesize*0.29)+leftmarge);
      digit2_1.Left:= (trunc (referencesize*0.38)+leftmarge);
      digit3_1.Left:= (trunc (referencesize*0.68)+leftmarge);
      if (state <> 5) and (archerysystem <> 'manual') and not((archerysystem='follow')and(followsystem='4')) then dots_1.Visible:=true;
    end;

    digit1_2.Constraints.maxheight:=trunc ((referencesize*0.5));
    digit1_2.Font.Height:= trunc ((referencesize*0.57)*mag);
    digit1_2.Height:=trunc ((referencesize*0.5)*mag);
    digit1_2.Top:=(trunc (referencesize*-0.07*mag*mag*mag)+topmarge);

    digit2_2.Constraints.maxheight:=trunc ((referencesize*0.5));
    digit2_2.Font.Height:= trunc ((referencesize*0.57)*mag);
    digit2_2.Height:=trunc ((referencesize*0.5)*mag);
    digit2_2.Top:=(trunc (referencesize*-0.07*mag*mag*mag)+topmarge);

    digit3_2.Constraints.maxheight:=trunc ((referencesize*0.5));
    digit3_2.Font.Height:= trunc ((referencesize*0.57)*mag);
    digit3_2.Height:=trunc ((referencesize*0.5)*mag);
    digit3_2.Top:=(trunc (referencesize*-0.07*mag*mag*mag)+topmarge);


    dots_2.Constraints.maxheight:=trunc((referencesize*0.36));

    dots_2.Height:=trunc ((referencesize*0.36)*mag);
    dots_2.Font.Height:= trunc ((referencesize*0.36*mag));
    dots_2.Top:=(trunc (referencesize*+0.03*mag*mag*mag)+topmarge);
    if seconds.Checked=true then     //horizontal position is different if minute notation is used because of extra dots_1.
    begin
      digit1_2.Left:= (trunc (referencesize*0.02)+leftmarge);
      digit2_2.Left:= (trunc (referencesize*0.33)+leftmarge);
      digit3_2.Left:= (trunc (referencesize*0.64)+leftmarge);
      dots_2.Visible:=false;
    end
    else
    begin
      digit1_2.Left:= (trunc (referencesize*0.001)+leftmarge);
      dots_2.Left:= (trunc (referencesize*0.29)+leftmarge);
      digit2_2.Left:= (trunc (referencesize*0.38)+leftmarge);
      digit3_2.Left:= (trunc (referencesize*0.68)+leftmarge);
      if (state <> 5) and (archerysystem <> 'manual')and not((archerysystem='follow')and(followsystem='4')) then dots_1.Visible:=true;
    end;



    case shooters of
      1,2,3,4:
      begin
        pshift:=1;
        pitch:=1;
        psize:=1;
        ptop:=1;
      end;
      5:
      begin
        pshift:=0.8;
        pitch:=0.8;
        psize:=0.9;
        ptop:=1.025;
      end;
      6:
      begin
        pshift:=0.68;
        pitch:=0.660;
        psize:=0.8;
        ptop:=1.05;
      end;


    end;

    shooteronearrow.Font.Height:=trunc ((referencesize*0.14)*mag);
    shooteronearrow.Width:=trunc ((referencesize*0.55)*mag);
    shooteronearrow.constraints.minwidth:=trunc ((referencesize*0.55));
    shooteronearrow.height:=trunc ((referencesize*0.14)*mag);
    shooteronearrow.top:=(trunc(referencesize*0.46)+topmarge);
    shooteronearrow.left:=(trunc (referencesize*0.15)+leftmarge);

    shooteronearrownr.Font.Height:=trunc ((referencesize*0.25)*mag);
    shooteronearrownr.Width:=trunc ((referencesize*1)*mag);
    shooteronearrownr.constraints.minwidth:=trunc ((referencesize*1));
    shooteronearrownr.height:=trunc ((referencesize*0.25)*mag);
    shooteronearrownr.top:=(trunc(referencesize*0.41)+topmarge);
    shooteronearrownr.left:=(trunc (referencesize*0.70)+leftmarge);

    TOPshooterlet.Font.Height:=trunc ((referencesize*0.25)*mag*psize);
    TOPshooterlet.Width:=trunc ((referencesize*0.3)*mag*psize);
    TOPshooterlet.constraints.minwidth:=trunc ((referencesize*0.2*psize));
    TOPshooterlet.constraints.maxwidth:=trunc ((referencesize*0.15*psize));
    TOPshooterlet.constraints.maxheight:=trunc ((referencesize*0.22*psize));
    TOPshooterlet.height:=trunc ((referencesize*0.25)*mag);
    TOPshooterlet.top:=(trunc (referencesize*0.41 *ptop)+topmarge);
    TOPshooterlet.left:=(trunc (referencesize*0.59)-(trunc (referencesize*0.23*3*0.5*pshift))+leftmarge);

    TOPshootertxt.Font.Height:=trunc ((referencesize*0.12)*mag*psize);
    TOPshootertxt.Width:=trunc ((referencesize*0.3)*mag*psize);
     TOPshootertxt.constraints.maxheight:=trunc ((referencesize*0.22*psize));
    TOPshootertxt.height:=trunc ((referencesize*0.25)*mag);
    TOPshootertxt.top:=(trunc (referencesize*0.48 *ptop)+topmarge);
    TOPshootertxt.left:=(trunc (referencesize*0.59)-(trunc (referencesize*0.77*0.5*pshift))+trunc (referencesize*0.2*pitch)+trunc(leftmarge));

    BOTshooterlet.Font.Height:=trunc ((referencesize*0.25)*mag*psize);
    BOTshooterlet.Width:=trunc ((referencesize*0.3)*mag*psize);
    BOTshooterlet.constraints.minwidth:=trunc ((referencesize*0.2*psize));
    BOTshooterlet.constraints.maxwidth:=trunc ((referencesize*0.15*psize));
    BOTshooterlet.constraints.maxheight:=trunc ((referencesize*0.22*psize));
    BOTshooterlet.height:=trunc ((referencesize*0.25)*mag);
    BOTshooterlet.top:=(trunc (referencesize*0.41 *ptop)+topmarge);
    BOTshooterlet.left:=(trunc (referencesize*0.59)-(trunc (referencesize*0.23*3*0.5*pshift))+leftmarge);

    BOTshootertxt.Font.Height:=trunc ((referencesize*0.12)*mag*psize);
    BOTshootertxt.Width:=trunc ((referencesize*0.3)*mag*psize);
    BOTshootertxt.constraints.maxheight:=trunc ((referencesize*0.22*psize));
    BOTshootertxt.height:=trunc ((referencesize*0.25)*mag);
    BOTshootertxt.top:=(trunc (referencesize*0.48 *ptop)+topmarge);
    BOTshootertxt.left:=(trunc (referencesize*0.59)-(trunc (referencesize*0.77*0.5*pshift))+trunc (referencesize*0.2*pitch)+trunc(leftmarge));



    shooter1.Font.Height:=trunc ((referencesize*0.25)*mag*psize);
    shooter1.Width:=trunc ((referencesize*0.3)*mag*psize);
    shooter1.constraints.minwidth:=trunc ((referencesize*0.2*psize));
    shooter1.constraints.maxwidth:=trunc ((referencesize*0.15*psize));
    shooter1.constraints.maxheight:=trunc ((referencesize*0.22*psize));
    shooter1.height:=trunc ((referencesize*0.25)*mag);
    shooter1.top:=(trunc (referencesize*0.41 *ptop)+topmarge);
    shooter1.left:=(trunc (referencesize*0.59)-(trunc (referencesize*0.23*Shooters*0.5*pshift))+leftmarge);

    shooter2.Font.Height:=trunc ((referencesize*0.25)*mag*psize);
    shooter2.Width:=trunc ((referencesize*0.3)*mag*psize);
    shooter2.constraints.minwidth:=trunc ((referencesize*0.2*psize));
    shooter2.constraints.maxwidth:=trunc ((referencesize*0.15*psize));
    shooter2.constraints.maxheight:=trunc ((referencesize*0.22*psize));
    shooter2.height:=trunc ((referencesize*0.25)*mag);
    shooter2.top:=(trunc (referencesize*0.41*ptop)+topmarge);
    shooter2.left:=(trunc (referencesize*0.59)-(trunc (referencesize*0.23*Shooters*0.5*pshift))+trunc (referencesize*0.2*pitch)+trunc(leftmarge));



    shooter3.Font.Height:=trunc ((referencesize*0.25)*mag*psize);
    shooter3.Width:=trunc ((referencesize*0.3)*mag*psize);
    shooter3.constraints.minwidth:=trunc ((referencesize*0.2*psize));
    shooter3.constraints.maxwidth:=trunc ((referencesize*0.15*psize));
    shooter3.constraints.maxheight:=trunc ((referencesize*0.22*psize));
    shooter3.height:=trunc ((referencesize*0.25)*mag);
    shooter3.top:=(trunc (referencesize*0.41*ptop)+topmarge);
    shooter3.left:=(trunc (referencesize*0.59)-(trunc (referencesize*0.23*Shooters*0.5*pshift))+trunc (referencesize*0.4*pitch)+trunc(leftmarge));



    shooter4.Font.Height:=trunc ((referencesize*0.25)*mag*psize);
    shooter4.Width:=trunc ((referencesize*0.3)*mag*psize);
    shooter4.constraints.minwidth:=trunc ((referencesize*0.2*psize));
    shooter4.constraints.maxwidth:=trunc ((referencesize*0.15*psize));
    shooter4.constraints.maxheight:=trunc ((referencesize*0.22*psize));
    shooter4.height:=trunc ((referencesize*0.25)*mag);
    shooter4.top:=(trunc (referencesize*0.41*ptop)+topmarge);
    shooter4.left:=(trunc (referencesize*0.59)-(trunc (referencesize*0.23*Shooters*0.5*pshift))+trunc (referencesize*0.6*pitch)+trunc(leftmarge));

    shooter5.Font.Height:=trunc ((referencesize*0.25)*mag*psize);
    shooter5.Width:=trunc ((referencesize*0.3)*mag*psize);
    shooter5.constraints.minwidth:=trunc ((referencesize*0.2*psize));
    shooter5.constraints.maxwidth:=trunc ((referencesize*0.15*psize));
    shooter5.constraints.maxheight:=trunc ((referencesize*0.22*psize));
    shooter5.height:=trunc ((referencesize*0.25)*mag);
    shooter5.top:=(trunc (referencesize*0.41*ptop)+topmarge);
    shooter5.left:=(trunc (referencesize*0.59)-(trunc (referencesize*0.23*Shooters*0.5*pshift))+trunc (referencesize*0.8*pitch)+trunc(leftmarge));

    shooter6.Font.Height:=trunc ((referencesize*0.25)*mag*psize);
    shooter6.Width:=trunc ((referencesize*0.3)*mag*psize);
    shooter6.constraints.minwidth:=trunc ((referencesize*0.2*psize));
    shooter6.constraints.maxwidth:=trunc ((referencesize*0.15*psize));
    shooter6.constraints.maxheight:=trunc ((referencesize*0.22*psize));
    shooter6.height:=trunc ((referencesize*0.25)*mag);
    shooter6.top:=(trunc (referencesize*0.41*ptop)+topmarge);
    shooter6.left:=(trunc (referencesize*0.59)-(trunc (referencesize*0.23*Shooters*0.5*pshift))+trunc (referencesize*1*pitch)+trunc(leftmarge));

    if archerysystem<>'fitafin' then
    begin
      if ((archerysystem='follow') and (followsystem='2')) then
      begin
        serienr.Top:=(trunc (referencesize*0.4)+topmarge);
        serienr.Left:=(trunc (referencesize*0.37)+leftmarge);
        serienr.Font.height:=trunc ((referencesize*0.2)*mag);
        serienr.Width:=trunc ((referencesize*0.25)*mag);
        serienr.constraints.minwidth:=trunc ((referencesize*0.25));
        serienr.height:=trunc ((referencesize*0.2)*mag);

      end
      else
      begin
        serienr.Top:=(trunc (referencesize*0.48)+topmarge);
        serienr.Left:=(trunc (referencesize*0.033)+leftmarge);
        serienr.Font.height:=trunc ((referencesize*0.09)*mag);
        serienr.Width:=trunc ((referencesize*0.09)*mag);
        serienr.constraints.minwidth:=trunc ((referencesize*0.09));
        serienr.height:=trunc ((referencesize*0.08)*mag);

      end;




    end;

    archeryclock.top:=(trunc (referencesize*0.19)+topmarge);
    emergencytext.top:=(trunc (referencesize*0.025)+topmarge) ;
end;

procedure TCountdownform.resizewindowall;     //change  items on the screen depending on screensize. Independent what type of match
begin
TLredlefton.Width:=trunc (referencesize*0.22);
TLredlefton.height:=trunc (referencesize*0.22);
TLredlefton.top:=(trunc (referencesize*0.01)+topmarge);
TLredlefton.left:=trunc (leftmarge-(referencesize*0.23));

TLredleftoff.Width:=trunc (referencesize*0.22);
TLredleftoff.height:=trunc (referencesize*0.22);
TLredleftoff.top:=(trunc (referencesize*0.01)+topmarge);
TLredleftoff.left:=trunc (leftmarge-(referencesize*0.23));

TLorangelefton.Width:=trunc (referencesize*0.22);
TLorangelefton.height:=trunc (referencesize*0.22);
TLorangelefton.top:=(trunc (referencesize*0.23)+topmarge);
TLorangelefton.left:=trunc (leftmarge-(referencesize*0.23));


TLorangeleftoff.Width:=trunc (referencesize*0.22);
TLorangeleftoff.height:=trunc (referencesize*0.22);
TLorangeleftoff.top:=(trunc (referencesize*0.23)+topmarge);
TLorangeleftoff.left:=trunc (leftmarge-(referencesize*0.23));

TLgrnlefton.Width:=trunc (referencesize*0.22);
TLgrnlefton.height:=trunc (referencesize*0.22);
TLgrnlefton.top:=(trunc (referencesize*0.45)+topmarge);
TLgrnlefton.left:=trunc (leftmarge-(referencesize*0.23));

TLgrnleftoff.Width:=trunc (referencesize*0.22);
TLgrnleftoff.height:=trunc (referencesize*0.22);
TLgrnleftoff.top:=(trunc (referencesize*0.45)+topmarge);
TLgrnleftoff.left:=trunc (leftmarge-(referencesize*0.23));

TLredrighton.Width:=trunc (referencesize*0.22);
TLredrighton.height:=trunc (referencesize*0.22);
TLredrighton.top:=(trunc (referencesize*0.01)+topmarge);
TLredrighton.left:=trunc (leftmarge+(referencesize*1.01));

TLredrightoff.Width:=trunc (referencesize*0.22);
TLredrightoff.height:=trunc (referencesize*0.22);
TLredrightoff.top:=(trunc (referencesize*0.01)+topmarge);
TLredrightoff.left:=trunc (leftmarge+(referencesize*1.01));

TLorangerighton.Width:=trunc (referencesize*0.22);
TLorangerighton.height:=trunc (referencesize*0.22);
TLorangerighton.top:=(trunc (referencesize*0.23)+topmarge);
TLorangerighton.left:=trunc (leftmarge+(referencesize*1.01));


TLorangerightoff.Width:=trunc (referencesize*0.22);
TLorangerightoff.height:=trunc (referencesize*0.22);
TLorangerightoff.top:=(trunc (referencesize*0.23)+topmarge);
TLorangerightoff.left:=trunc (leftmarge+(referencesize*1.01));

TLgrnrighton.Width:=trunc (referencesize*0.22);
TLgrnrighton.height:=trunc (referencesize*0.22);
TLgrnrighton.top:=(trunc (referencesize*0.45)+topmarge);
TLgrnrighton.left:=trunc (leftmarge+(referencesize*1.01));

TLgrnrightoff.Width:=trunc (referencesize*0.22);
TLgrnrightoff.height:=trunc (referencesize*0.22);
TLgrnrightoff.top:=(trunc (referencesize*0.45)+topmarge);
TLgrnrightoff.left:=trunc (leftmarge+(referencesize*1.01));



serielabel.Top:=(trunc (referencesize*0.45)+topmarge);
serielabel.Left:=(trunc (referencesize*0.008)+leftmarge);
serielabel.Font.height:=trunc ((referencesize*0.035)*mag);
serielabel.Width:=trunc ((referencesize*0.09)*mag);
serielabel.constraints.minwidth:=trunc ((referencesize*0.09)*mag);
serielabel.height:=trunc ((referencesize*0.035)*mag);

arrowlabel.Top:=(trunc (referencesize*0.45)+topmarge);
arrowlabel.Left:=(trunc (referencesize*0.008)+leftmarge);
arrowlabel.Font.height:=trunc ((referencesize*0.035)*mag);
arrowlabel.Width:=trunc ((referencesize*0.08)*mag);
arrowlabel.constraints.minwidth:=trunc ((referencesize*0.08)*mag);
arrowlabel.height:=trunc ((referencesize*0.035)*mag);

turnlabel.Top:= (trunc (referencesize*0.45)+topmarge);
turnlabel.Left:=(trunc (referencesize*0.88)+leftmarge);
turnlabel.Font.height:=trunc ((referencesize*0.035)*mag);
turnlabel.Width:=trunc ((referencesize*0.08)*mag);
turnlabel.constraints.minwidth:=trunc ((referencesize*0.08)*mag);
turnlabel.height:=trunc ((referencesize*0.035)*mag);

Practise.Top:= (trunc (referencesize*0.485)+topmarge);
Practise.Left:=(trunc (referencesize*0.00001)+leftmarge);
Practise.Font.height:=trunc ((referencesize*0.08)*mag);
Practise.Width:=trunc ((referencesize*0.045)*mag);
Practise.constraints.minwidth:=trunc ((referencesize*0.045)*mag);
Practise.height:=trunc ((referencesize*0.08)*mag);


shooternr.Top:=(trunc (referencesize*0.48)+topmarge);
shooternr.Left:=(trunc (referencesize*0.88)+leftmarge);
shooternr.Font.height:=trunc ((referencesize*0.07)*mag);
shooternr.Width:=trunc ((referencesize*0.09)*mag);
shooternr.constraints.minwidth:=trunc ((referencesize*0.09)*mag);
shooternr.height:=trunc ((referencesize*0.06)*mag);

archeryclock.font.height:=trunc ((referencesize*0.06)*mag);
archeryclock.left:=leftmarge;
archeryclock.Width:= trunc (referencesize*1);
archeryclock.constraints.minwidth:= trunc (referencesize*1);

emergencytext.font.height:=trunc ((referencesize*2.1)*mag*mag/(Length(emergencytext.Caption)));
emergencytext.left:=leftmarge;
emergencytext.Width:= trunc ((referencesize*1));
emergencytext.constraints.minwidth:= trunc (referencesize*1);
emergencytext.Height:=trunc ((referencesize*0.596));
emergencytext.Constraints.MaxHeight:=trunc ((referencesize*0.596));
emergencytext.Constraints.MinHeight:=trunc ((referencesize*0.596));


websitename.Width:= trunc (referencesize);
websitename.left:=leftmarge;
websitename.top:=(trunc (referencesize*0.625)+topmarge);
websitename.font.height:=trunc ((referencesize*0.103)*mag);

bannerpicture.Width:=trunc(referencesize*0.00114*bannerscaling*bannerAR);
bannerpicture.Height:=trunc(referencesize*0.00114*bannerscaling);
bannerpicture.Top:=(trunc (referencesize*0.59)+topmarge);
bannerpicture.Left:=(trunc (referencesize*0.5)+ leftmarge - trunc(referencesize*0.00057*bannerscaling*bannerAR));

beforestartbg.Left:=leftmarge;
beforestartbg.Top:=(trunc (referencesize*0.03)+topmarge);
beforestartbg.Width:=(trunc (referencesize*0.644*1.55));
beforestartbg.height:=(trunc (referencesize*0.266*1.55));

beforestarttxt2.Left:=(trunc (referencesize*0.12)+ leftmarge);
beforestarttxt2.top:=(trunc (referencesize*0.39)+topmarge);
beforestarttxt2.Font.height:=trunc ((referencesize*0.065)*mag);
beforestarttxt2.Width:=trunc (referencesize*0.76);
beforestarttxt2.constraints.minwidth:=trunc (referencesize*0.76);
beforestarttxt2.height:=trunc (referencesize*0.055);

beforestarttxt1.Left:=(trunc (referencesize*0.12)+ leftmarge);
beforestarttxt1.top:=(trunc (referencesize*0.02)+topmarge);
beforestarttxt1.Font.height:=trunc ((referencesize*0.062)*mag*mag);
beforestarttxt1.Width:=trunc (referencesize*0.77);
beforestarttxt1.constraints.minwidth:=trunc (referencesize*0.77);
beforestarttxt1.height:=trunc (referencesize*0.065);


digit1_3.Constraints.maxheight:=trunc ((referencesize*0.4));
digit1_3.Font.Height:= trunc ((referencesize*0.47)*mag);
digit1_3.Height:=trunc ((referencesize*0.4)*mag);
digit1_3.Top:=(trunc (referencesize*-0.01)+topmarge);

digit2_3.Constraints.maxheight:=trunc ((referencesize*0.4));
digit2_3.Font.Height:= trunc ((referencesize*0.47)*mag);
digit2_3.Height:=trunc ((referencesize*0.4)*mag);
digit2_3.Top:=(trunc (referencesize*-0.01)+topmarge);

digit3_3.Constraints.maxheight:=trunc ((referencesize*0.4));
digit3_3.Font.Height:= trunc ((referencesize*0.47)*mag);
digit3_3.Height:=trunc ((referencesize*0.4)*mag);
digit3_3.Top:=(trunc (referencesize*-0.01)+topmarge);


dots_3.Font.Height:= trunc ((referencesize*0.29)*mag);
dots_3.Height:=trunc ((referencesize*0.29)*mag);
dots_3.Constraints.maxheight:=trunc((referencesize*0.9));
dots_3.Top:=(trunc (referencesize*+0.07)+topmarge);
digit1_3.Left:= (trunc (referencesize*0.1)+leftmarge);
dots_3.Left:= (trunc (referencesize*0.35)+leftmarge);
digit2_3.Left:= (trunc (referencesize*0.43)+leftmarge);
digit3_3.Left:= (trunc (referencesize*0.68)+leftmarge);

savesettings.Top:=(trunc(Countdownform.height) -175);
ScenarioScrollBox.Height:=(trunc(Countdownform.height) -190);
savesettings.left:=(trunc(Countdownform.width*0.5) -320);
timeseqpanel.Top:=(trunc(Countdownform.height*1) -320 );
timeseqpanel.left:=(trunc(Countdownform.width*0.5) -320);
prepsetpanel.left:=(trunc(Countdownform.width*0.5) -320);
prepsetpanel.Top:=0;
prepsetpanel.Height:=(trunc(Countdownform.height) -175);


//buttons

seriedown.Top:= Countdownform.Height-iconsize; //always left bottom of the screen
seriedown.left:= 0;
seriedown.Font.Size:=iconsize div 2;
seriedown.Width:=iconsize;
seriedown.Height:=iconsize;

serieup.top:= Countdownform.Height-iconsize;
serieup.left:= iconsize;     //allways next to seriedown button
serieup.Font.Size:=iconsize div 2;
serieup.Width:=iconsize;
serieup.Height:=iconsize;

turnup.top:= Countdownform.Height-iconsize;     //always right bottom of the screen
turnup.left:= Countdownform.width-iconsize;
turnup.Font.Size:=iconsize div 2;
turnup.Width:=iconsize;
turnup.Height:=iconsize;

turndown.Top:= Countdownform.Height-iconsize;         //allways next to turnup button
turndown.left:= Countdownform.width-iconsize-iconsize;
turndown.Font.Size:=iconsize div 2;
turndown.Width:=iconsize;
turndown.Height:=iconsize;

nexticon.top:= Countdownform.height-iconsize-1;       //allways bottom middle
nexticon.Left:= trunc (Countdownform.width*0.5)-(iconsize div 2);
nexticon.Width:=iconsize;
nexticon.height:=iconsize;

SOicon.top:= Countdownform.height-iconsize-1;
SOicon.Left:= trunc (6.5*iconsize);
SOicon.Width:=iconsize;
SOicon.Height:=iconsize;

preptime.top:=Countdownform.height-iconsize-1;
preptime.Left:=trunc (8*iconsize);
preptime.Width:=iconsize;
preptime.Height:=iconsize;
countdowntostart.Top:=Countdownform.height-iconsize+1;
countdowntostart.Left:=trunc (9*iconsize);
countdowntostart.Font.Size:=iconsize div 2;

resizeicon.top:=1;            //alway left top side
resizeicon.Left:=1;
resizeicon.Width:=iconsize;
resizeicon.Height:=iconsize;

closeicon.top:=1;               //always top right side
closeicon.Left:=Countdownform.width-iconsize-1;
closeicon.Width:=iconsize;
closeicon.Height:=iconsize;

playpauzeicon.top:= Countdownform.height-iconsize-1;
playpauzeicon.left:=trunc (3.5*iconsize);
playpauzeicon.Width:=iconsize;
playpauzeicon.Height:=iconsize;

stopicon.top:= Countdownform.height-iconsize-1;
stopicon.Left:=trunc(5*iconsize);
stopicon.Width:=iconsize;
stopicon.Height:=iconsize;

danger.top:= Countdownform.height-iconsize-1;
danger.Left:=trunc(12*iconsize);
danger.Width:=iconsize;
danger.Height:=iconsize;


manualred.top:= Countdownform.height-trunc(1.5*iconsize)-1;
manualred.Left:=trunc(16*iconsize);
manualred.Width:=trunc(1.5*iconsize);
manualred.Height:=trunc(1.5*iconsize);

manualorange.top:= Countdownform.height-trunc(1.5*iconsize)-1;
manualorange.Left:=trunc(18*iconsize);
manualorange.Width:=trunc(1.5*iconsize);
manualorange.Height:=trunc(1.5*iconsize);

manualgreen.top:= Countdownform.height-trunc(1.5*iconsize)-1;
manualgreen.Left:=trunc(20*iconsize);
manualgreen.Width:=trunc(1.5*iconsize);
manualgreen.Height:=trunc(1.5*iconsize);


buzzicon1.top:= Countdownform.height-trunc(1.5*iconsize)-1;
buzzicon1.Left:=trunc(4*iconsize);
buzzicon1.Width:=trunc(1.5*iconsize);
buzzicon1.Height:=trunc(1.5*iconsize);

buzzicon2.top:= Countdownform.height-trunc(1.5*iconsize)-1;
buzzicon2.Left:=trunc(6*iconsize);
buzzicon2.Width:=trunc(1.5*iconsize);
buzzicon2.Height:=trunc(1.5*iconsize);

buzzicon3.top:= Countdownform.height-trunc(1.5*iconsize)-1;
buzzicon3.Left:=trunc(8*iconsize);
buzzicon3.Width:=trunc(1.5*iconsize);
buzzicon3.Height:=trunc(1.5*iconsize);


USB.Top:=Countdownform.height-iconsize-1;
USB.Left:=trunc (Countdownform.width-(7.5*iconsize));
USB.Width:=iconsize;
USB.Height:=iconsize;
USBconnect.Top:=Countdownform.height-iconsize+1;
USBconnect.Left:=trunc (Countdownform.width-(13.9*iconsize));
USBconnect.Font.Size:=iconsize div 2;

settings.top:= Countdownform.height-iconsize-1;
settings.Left:=trunc (Countdownform.width-(4*iconsize));
settings.Width:=iconsize;
settings.Height:=iconsize;

clockicon.top:= Countdownform.height-iconsize-1;
clockicon.Left:=trunc (Countdownform.width-(5.5*iconsize));
clockicon.Width:=iconsize;
clockicon.Height:=iconsize;


//hint labels
{$IFDEF Windows}
nexthelp.Top:=Countdownform.Height-iconsize-15;
chooselabel.Top:=Countdownform.Height-iconsize-15;
nexthelp.Left:=trunc (Countdownform.width*0.5)-100;
chooselabel.Left:=trunc (Countdownform.width*0.5)-100;
{$ENDIF}
{$IFDEF Unix}
nexthelp.Top:=Countdownform.Height-iconsize-22;
chooselabel.Top:=Countdownform.Height-iconsize-22;
nexthelp.Left:=trunc (Countdownform.width*0.5)-250;
chooselabel.Left:=trunc (Countdownform.width*0.5)-250;
{$ENDIF}







end;

procedure TCountdownform.serialport1Change(Sender: TObject);
begin
  serial.Device:=serialport1.Text;
    if arduinoselect1.checked=true then
    begin
      serial.Active:=false;
      if initializationstate=false then connect;
    end;


end;



procedure TCountdownform.show_commercialTimer(Sender: TObject);
//please leave this commercial in the software. Or at least keep the text www.archeryclock.com on
//thes screen during state 1 (waiting)
//This is a free timer to give archeryclubs the possibility to hava an archerytimer for minimum costs.
//But this is the only way to let them know it exists.
begin
  labelnr :=labelnr +1;
  if labelnr=34 then labelnr:=1;
  case labelnr of
  1,2,3: archeryclock.caption:='Free';
  4: archeryclock.caption:='Archery';
  5: archeryclock.caption:='CountDown';
  6: archeryclock.caption:='Timer';
  else archeryclock.caption:='www.archeryclock.com';
  end;
end;

procedure TCountdownform.TLgrnleftoffClick(Sender: TObject);
begin
  If archerysystem='manual' then setgreen;
end;

procedure TCountdownform.TLgrnleftonClick(Sender: TObject);
begin
  If archerysystem='manual' then setgreen;
end;

procedure TCountdownform.TLgrnrightoffClick(Sender: TObject);
begin
  If archerysystem='manual' then setgreen;
end;

procedure TCountdownform.TLgrnrightonClick(Sender: TObject);
begin
  If archerysystem='manual' then setgreen;
end;

procedure TCountdownform.TLorangeleftoffClick(Sender: TObject);
begin
  If archerysystem='manual' then setorange;
end;

procedure TCountdownform.TLorangeleftonClick(Sender: TObject);
begin
  If archerysystem='manual' then setorange;
end;

procedure TCountdownform.TLorangerightoffClick(Sender: TObject);
begin
  If archerysystem='manual' then setorange;
end;

procedure TCountdownform.TLorangerightonClick(Sender: TObject);
begin
  If archerysystem='manual' then setorange;
end;

procedure TCountdownform.TLredleftoffClick(Sender: TObject);
begin
  If archerysystem='manual' then setred;
end;

procedure TCountdownform.TLredleftonClick(Sender: TObject);
begin
  If archerysystem='manual' then setred;
end;

procedure TCountdownform.TLredrightoffClick(Sender: TObject);
begin
  If archerysystem='manual' then setred;
end;

procedure TCountdownform.TLredrightonClick(Sender: TObject);
begin
  If archerysystem='manual' then setred;
end;

procedure TCountdownform.Turns_per_endClick(Sender: TObject);
begin

end;

procedure TCountdownform.UDP1Receive(aSocket: TLSocket);
var
  s: string;
begin
  if aSocket.GetMessage(s) > 0 then
  begin
    PCnameLabel.Caption:=s;

  end;
end;

procedure TCountdownform.UDPfollowReceive(aSocket: TLSocket);
var
  s: string;
begin
  if aSocket.GetMessage(s) > 0 then
  begin
  end;
end;

procedure TCountdownform.varF1BevelChangeBounds(Sender: TObject);
begin

end;

procedure TCountdownform.viewleftClick(Sender: TObject);
begin
  showtarget.Checked:=false;
  showtarget.Enabled:=false;
  startupscenario.Text:='--';
  views;
  resizewindow;
  resizewindowfinals;

end;

procedure TCountdownform.viewrightChange(Sender: TObject);
begin

end;

procedure TCountdownform.viewrightClick(Sender: TObject);
begin
  showtarget.Checked:=false;
  showtarget.Enabled:=false;
  startupscenario.Text:='--';
  views;
  resizewindow;
  resizewindowfinals;
end;

procedure TCountdownform.resizewindow;
// This procedure is meant to correct the size of all characters and pictures used during countdown, When the size of the window changes, or initially at startup of the program.
// Size of the characters is also depending if the trafic lights are shown on the screen. With traffic lights shown, the characters and pictures need to be smaller to fit in the window
// Depending on the aspect ratio, the size of the characters/pictures is based on width or height of the window. this is determined by checking the aspect ratio
begin
  if (usetraffic.checked=true) or (archerysystem='manual') or ((archerysystem='follow') and (followsystem='4')) then //trafic lights are shown on the sreen so characters and letters need to be smaller
  begin
    aspectratio:= 1.65;   //total shown characters and pictures is widescreen because traffic lights are added next to the countdown
    if (Countdownform.Width *1) > (Countdownform.height * aspectratio) then
    begin  //used screen is wider than aspect ratio, so size of characters is based on height of screen
      referencesize:=trunc(Countdownform.height * 1.33);
      //if archerysystem<>'fitafin'then
      if  ((archerysystem<>'fitafin') or ((archerysystem='fitafin')and (finarrow.Checked=false))) then
      begin          //It is not a finalround so trafic lights are only on one side. So horizontal position of countdown is depending on the location of the trafic lights (left ot right)
         if (TLright.checked=true)then leftmarge:=(trunc(((Countdownform.Width*0.376)-(referencesize* 0.376*1.25))*1.4)) else leftmarge:=(trunc(((Countdownform.Width* 0.376)-(referencesize* 0.376 /1.65))*1.15));
      end
      else
      begin     // it is a final round, so trafic lights are on both sides and countdown is still in the middle
        leftmarge:=((trunc(Countdownform.Width-referencesize))div 2);
      end;
      topmarge:=0;
    end
    else
    begin  //used screen is smaller than aspect ratio, so size of characters is based on width of screen
      referencesize:= trunc (Countdownform.Width * 1.33 /aspectratio) ;
      if  ((archerysystem<>'fitafin') or ((archerysystem='fitafin')and (finarrow.Checked=false))) then
      begin  //It is not a finalround so trafic lights are only on one side. So horizontal position of countdown is depending on the location of the trafic lights (left ot right)
        if (TLright.checked=true) then leftmarge:=0 else leftmarge:=(trunc(Countdownform.Width-referencesize));
      end
      else
      begin
        leftmarge:=((trunc(Countdownform.Width-referencesize))div 2);
      end;
      topmarge:=((trunc((Countdownform.height * 1.33)-referencesize))div 2);

    end;
  end
  else       //trafic lights are not shown on the sreen so characters and letters need to be bigger
  begin
    aspectratio:= 1.33;  //total shown characters and pictures is  not widescreen (4:3) because traffic lights are not added next to the countdown
    if (Countdownform.Width *1) > (Countdownform.height * aspectratio) then
    begin  //used screen is wider than aspect ratio, so size of characters is based on height of screen
      referencesize:=trunc(Countdownform.height * 1.33 );
      leftmarge:=((trunc(Countdownform.Width-referencesize))div 2);
      topmarge:=0;
    end
    else
    begin  //used screen is smaller than aspect ratio, so size of characters is based on width of screen
      referencesize:= trunc (Countdownform.Width) ;
      leftmarge:=0;
      topmarge:=((trunc((Countdownform.height * 1.33)-referencesize))div 2);

    end;
  end;

  //Size of the icons is depending on the windowsize
  if (Countdownform.Width *1) > (Countdownform.height * 1.33) then
  begin
    iconsize:=trunc(Countdownform.height * 1.33/38 );
  end
  else
  begin
    iconsize:= trunc (Countdownform.Width/38) ;
  end;
  if iconsize > 25 then iconsize:=25;    //But size of the Icons does not need to be bigger than 25.

  //Addapt the size of the copyright header to the references size
  copyright.Font.Height:= trunc ((referencesize*0.02)*mag);
  copyright.top:=0;
  copyright.left:=25+leftmarge;
  copyright.width:= trunc (referencesize-50);
  copyright.constraints.minwidth:= trunc (referencesize-50);

  greenleft.Width:=trunc (referencesize*0.40);
  greenleft.height:=trunc (referencesize*0.14);
  greenleft.top:=(trunc (referencesize*0.45)+topmarge);
  greenleft.left:=trunc (leftmarge);

  greyleft.Width:=trunc (referencesize*0.40);
  greyleft.height:=trunc (referencesize*0.14);
  greyleft.top:=(trunc (referencesize*0.45)+topmarge);
  greyleft.left:=trunc (leftmarge);

  greenright.Width:=trunc (referencesize*0.40);
  greenright.height:=trunc (referencesize*0.14);
  greenright.top:=(trunc (referencesize*0.45)+topmarge);
  greenright.left:=trunc (leftmarge+((referencesize*0.60)));

  greyright.Width:=trunc (referencesize*0.40);
  greyright.height:=trunc (referencesize*0.14);
  greyright.top:=(trunc (referencesize*0.45)+topmarge);
  greyright.left:=trunc (leftmarge+((referencesize*0.60)));


  //Addapt the size of the digits to the references size. Size of Characters is depending if final round is used or not

  if archerysystem <>'fitafin' then

  begin
    resizewindownonfinals;

  end
  else //finalround
  begin
    resizewindowfinals;

  end;

  //size the same for final and non final rounds:
  resizewindowall;


end;

procedure TCountdownform.soundsignal;

(*
This procedure manages the sound. via the pc speakers. and hardware interface.
Nr of beeps,  sound, etc are set correct. After this the sound will be done via "buzzertimer"
*)

{$IFDEF Unix}
var
  Player: TProcessUTF8;
  PlayerPath: String;
  PlayerParams: String;
{$ENDIF}
begin

 if (archerysystem = 'manual') or (archerysystem = 'follow') then
 begin
   nrofbeeps:=nrofmanualbeeps;
 end
 else
 Case state of
   1: nrofbeeps:=3;
   2: nrofbeeps:=2;
   3: nrofbeeps:=1;
   4: nrofbeeps:=1;
   5: nrofbeeps:=3;
   6: begin
        nrofbeeps:=4;
        //state:=1;
      end
   else nrofbeeps:=0;
 end;
 buzzeron:=1;
 if (archerysystem = 'manual') or (archerysystem = 'follow') then switchbox;
 if speaker.checked=true then
 begin
   wavbuffer:=soundselect.Text;
   WavFilename:=PChar(LowerCase(Filespath+'sounds/'+wavbuffer+'.wav'));
   //Writeln(WavFilename);
   //copyright.Caption:=Wavfilename;      remove
   {$IFDEF Windows}
   sndPlaySound(WavFilename, snd_Async or snd_NoDefault);
   {$ENDIF}
   {$IFDEF Unix}
   begin
     /// SDL Stuff
     wave := Nil;

    wave := Mix_LoadWAV(WavFilename);
    if(wave = Nil) then
    begin
	ShowMessage('Unable to load WAV file');
    end;

    channel := Mix_PlayChannel(-1, wave, 0);
    if(channel = -1) then
    begin
	ShowMessage('Unable to play WAV file');
    end
    //END SDL Stuf
   end;

   {$ENDIF}
 end;
 buzzertimer.Enabled:=true;


end;

procedure TCountdownform.checknextsecond;
//This is a quick and dirty solution to use the system clock. Possibly there is a better solution possible
//the reference time +1  is compared with the system time of the PC. if the difference is 0 seconds, it means it is 1 second later. The clock can show the next second.
//because the outcome of the subtraction is depending on the way the time is printed, which is depending to the country settings, there are a lot of comparations.
//for example some countries use '.' other use ':'. Some use AM/PM, some use hour values higher than 12. I tried all default country settings available in win7 to check all possible values.
begin
  if (TimeToStr(referencetime-systemtime) <> '0.00.00') and (TimeToStr(referencetime-systemtime) <> '00.00.00') and (TimeToStr(referencetime-systemtime) <> '12.00.00') and (TimeToStr(referencetime-systemtime) <> '0:00:00') and (TimeToStr(referencetime-systemtime) <> '00:00:00') and (TimeToStr(referencetime-systemtime) <> '12:00:00') and (TimeToStr(referencetime-systemtime) <> '12:00:00 PD') and (TimeToStr(referencetime-systemtime) <> '12:00:00 a.m.') and (TimeToStr(referencetime-systemtime) <> '12:00:00 AM') and (TimeToStr(referencetime-systemtime) <> '12.00.00 AM') and (TimeToStr(referencetime-systemtime) <> '12:00:00 ðì') and (TimeToStr(referencetime-systemtime) <> '12:00:00 ???') and (TimeToStr(referencetime-systemtime) <> '12:00:00 Õ') and (TimeToStr(referencetime-systemtime) <> '12:00:00 ?.?') and (TimeToStr(referencetime-systemtime) <> '?????? 12:00:00') and (TimeToStr(referencetime-systemtime) <> '¤W¤È 12:00:00') and (TimeToStr(referencetime-systemtime) <> 'AM 12:00:00')
 and (TimeToStr(referencetime-systemtime) <> '12:00:00 Safe') and (TimeToStr(referencetime-systemtime) <> '12:00:00 Ututu') and (TimeToStr(referencetime-systemtime) <> '12:00:00 saa moya z.m.') and (TimeToStr(referencetime-systemtime) <> '¿ÀÀü 12:00:00') and (TimeToStr(referencetime-systemtime) <> '12:00:00 Þ.Ù') and (TimeToStr(referencetime-systemtime) <> '???? 12:00:00') and (TimeToStr(referencetime-systemtime) <> '12:00:00 ??.?.') and (TimeToStr(referencetime-systemtime) <> '12:00:00 SA') and (TimeToStr(referencetime-systemtime) <> '12:00:00 Owuro') then nextsec:=1 else nextsec:=0;
end;

procedure TCountdownform.finalyzeturn;
begin
(*
This procedure finalyzes the turn if the trafic light is green or orange
*)
          if (((turnnumber =turnsperserie) and (serienumber mod turnsss =0)) or (Shootoff=1)) then    //finalyze the end
          begin
            FirstTimer.enabled:=false ;
            endtimout.Enabled:=true;
            if state<>6 then state:=1;   //if emergency (stat6) first 4 soundsignals
            //starttostart;
            soundsignal;
            state:=1;
            if (Practiseturn=1) and (Shootoff=0) then //if A
            if ((archerysystem='fita') and (serienumber>=(Practiseturns.value-times+1))) or ((archerysystem='25m1p') and (serienumber=nrof1ppractisearrows.value))then  //if B
            begin
              serienumber:=1;
              Practiseturn:=0;
            end
            else //else B
            begin
              serienumber:=serienumber+(1*times);
              if (serienumber+1) mod times = 1 then serienumber:=serienumber-1;
            end
            else //else A
            if Shootoff=0 then
            begin
              serienumber:=serienumber+(1*times);
              if (serienumber+1) mod times = 1 then serienumber:=serienumber-1;
            end;
            if Shootoff <> 1 then turnnumber:=1;
            countdowntimer:=0;
            Shootoff:=0;
            if (precountalways.Checked=true)and(archerysystem='fita')  then
            begin
              //endtimout.Enabled:=false;
              starttostart;

            end;
            views;

          end
          else
          begin
            if ((Shootoff=0) and (turnnumber =turnsperserie)) then
            begin
              serienumber:=serienumber+(1*times);
              if (serienumber+1) mod times = 1 then serienumber:=serienumber-1;
              turnnumber:=0;
            end;
            if state<>6 then state:=2;
            soundsignal;

            if archerysystem='fita' then
            begin
              if redtime.Value = -1 then
              begin
                countdowntimer:=0;
                if FirstTimer.enabled=true then  playpauze;
              end
              else countdowntimer:= redtime.Value;

            end;
            if archerysystem='25m1p' then countdowntimer:= redtime1p.Value;
            //if state <>6 then
            turnnumber:=turnnumber+1;
            state:=2;
          end;


end;


procedure TCountdownform.FirstTimerTimer(Sender: TObject);

//This is the timer to count down. the timer is faster than 1 sec, (default 0.1 second)but the "checknextsecond" function keeps the timer in sync with the system clock
//if for some reasons the time gets a delay. (Processor overloaded, the system will correct this because it uses the system time. In that case it counts fast down (0.1sec per digit) till it is back at actual time.

begin
  systemtime:=Now;
  begin
    if countdowntimer> 1 then   //actual time left is not 0
    begin
      checknextsecond;
      if nextsec=1 then
      begin
        referencetime:=IncSecond(referencetime, 1);      //decrease reference time with one second to triger the next count a second later
        countdowntimer:=countdowntimer-1;              //decrease the projected time with 1 second
        //if the projected time is equal to orange time setting, change to state 4: orange.

        if  (((countdowntimer <= orangetime.value)and (archerysystem='fita')and (Shootoff=0)) and (state=3))and (state <>2) then  state:=4;
        if  (((countdowntimer = orangetime1p.value)and (archerysystem='25m1p')) and (state=3))and (state <>2) then  state:=4;
        if  (((countdowntimer = (orangetimeso.Value)*nrofSOarrows)and (Shootoff=1)and (archerysystem='fita'))  and (state=3))and (state <>2) then  state:=4;
        if  (((countdowntimer = orangefinal.value)and (archerysystem='fitafin')and (timeperturn.checked=true))and (state=3))and (state <>2) then  state:=4;
        if  (((countdowntimer = orangefinalend.value)and (archerysystem='fitafin')and (timeperend.checked=true))and (state=3))and (state <>2) then  state:=4;


      end;
    end
    else
    begin                //actual time left is 0 so a state change is needed
      case state of
        1,5:    //waittime , so change to red time (state 2)
        begin
          checknextsecond;
          if nextsec=1 then
          begin
            referencetime:=IncSecond(referencetime, 1);
            //if archerysystem<>'follow' then
            state:=2;
            soundsignal;

            if archerysystem='fita' then
            begin
              if redtime.Value = -1 then
              begin
                countdowntimer:=0;
                playpauze;
              end
              else countdowntimer:= redtime.Value;

            end;


            if archerysystem='25m1p' then countdowntimer:= redtime1p.Value;
            if (archerysystem='fitafin')and (timeperturn.checked=true) then countdowntimer:= redfinal.Value;
            if (archerysystem='fitafin')and (timeperend.checked=true) then countdowntimer:= redfinalend.Value;
             FirstTimer.enabled:=true ;
          end;
        end;
        2:    //redtime , so change to green time (state 3)
        begin
          checknextsecond;
          if nextsec=1 then
          begin
            referencetime:=IncSecond(referencetime, 1);
            if greentime.value = 0 then state:=4 else state:=3;

            soundsignal;
            if (archerysystem='fita') and (Shootoff=0) then
            begin
              if greentime.value = -1 then
              begin
                if orangetime.Value = -1 then countdowntimer:= 0 else countdowntimer:= times*(orangetime.Value);
                playpauze;

              end
              else
              begin
                if orangetime.Value = -1 then
                begin
                  countdowntimer:= times* (greentime.value)  ;
                  playpauze;
                end
                else countdowntimer:= times*(orangetime.Value +greentime.value);
              end;

            end;
            if (archerysystem='25m1p')  then countdowntimer:= orangetime1p.Value +greentime1p.value;
            if (archerysystem='fita') and (Shootoff=1) then countdowntimer:= (orangetimeso.Value)*nrofSOarrows +(greentimeso.value)*nrofSOarrows;
            if ((archerysystem='fitafin')and(timeperturn.checked=true))then countdowntimer:= (orangefinal.Value) +(greenfinal.value);
            if ((archerysystem='fitafin')and(timeperend.checked=true))then countdowntimer:= (orangefinalend.Value) +(greenfinalend.value);
            if greentime.value <> -1 then FirstTimer.enabled:=true ;
          end;
        end;
        3:    //greentime. Can get in this situation in case orange setting is 0. Next state is depending if this is the last turn in this end or not. This is aranged in routine finalyzeturn or nextfinal
        begin
          checknextsecond;
          if nextsec=1 then
          begin
            referencetime:=IncSecond(referencetime, 1);

            if  (((archerysystem='fita') and (orangetime.value=-1) and (Shootoff=0)) and (state=3))and (state <>2) then
            begin
              if FirstTimer.enabled=true then  playpauze;
              state:=4;
              countdowntimer:=0;
            end
            else
            begin
              if archerysystem<>'fitafin' then finalyzeturn else nextfinal;
            end;



          end;

        end;
        4: //orangetime.    Next state is depending if this is the last turn in this end or not. This is aranged in routine finalyzeturn or nextfinal
        begin
          checknextsecond;
          if nextsec=1 then
          begin
            referencetime:=IncSecond(referencetime, 1);
            if  (((archerysystem='fita') and (orangetime.value=-1) and (Shootoff=0)))and (state <>2) then
            begin

              finalyzeturn;
              if FirstTimer.enabled=true then  playpauze;
              //countdowntimer:=0;
            end
            else
            begin

              if archerysystem<>'fitafin' then finalyzeturn else nextfinal;
            end;
          end //;
                    else
          if ((orangetime.value=-1)  and (archerysystem='fita')) then
          begin
            state:=4;
            FirstTimer.enabled:=false ;
          //playpauze;
          end

        end;
      End;  {End Case1}
    end;
    views;  //change items on screen depending on the new state.
  end;


end;



procedure TCountdownform.FormResize(Sender: TObject);
begin
  resizewindow;
end;






procedure TCountdownform.K8055selectChange(Sender: TObject);
begin
  if initializationstate=false then connect;
end;



Function bitstodigit (BIT1,BIT2,BIT3,BIT4:string):string;
var tot:integer;

begin
  tot:=0;
  if BIT4='1'then tot:=tot+1;
  if BIT3='1'then tot:=tot+2;
  if BIT2='1'then tot:=tot+4;
  if BIT1='1'then tot:=tot+8;

  case tot of
  15: bitstodigit:='15';
  14: bitstodigit:='0';
  12: bitstodigit:='0';
  10: bitstodigit:='0';
  0: bitstodigit:='0';
  1: bitstodigit:='1';
  2: bitstodigit:='2';
  3: bitstodigit:='3';
  4: bitstodigit:='4';
  5: bitstodigit:='5';
  6: bitstodigit:='6';
  7: bitstodigit:='7';
  8: bitstodigit:='8';
  9: bitstodigit:='9';
  else bitstodigit:='0';

  end;

end;



Procedure TCountdownform.switchfollow;
var ii, turnperend, sernum:integer;
begin
  If ((foltime1[13]='0'))then minsec.ItemIndex:=0;
  If ((foltime1[13]='1'))then minsec.ItemIndex:=1;

  if state <>5 then
  begin
    if (leftscreen.Checked=true) then
    begin
      digit3_1.Caption:= bitstodigit(foltime1[9],foltime1[10],foltime1[11],foltime1[12]);
      digit2_1.Caption:= bitstodigit(foltime1[5],foltime1[6],foltime1[7],foltime1[8]);
      digit1_1.Caption:= bitstodigit(foltime1[1],foltime1[2],foltime1[3],foltime1[4]);
    end
    else
    begin
     digit3_1.Caption:= bitstodigit(foltime2[9],foltime2[10],foltime2[11],foltime2[12]);
     digit2_1.Caption:= bitstodigit(foltime2[5],foltime2[6],foltime2[7],foltime2[8]);
     digit1_1.Caption:= bitstodigit(foltime2[1],foltime2[2],foltime2[3],foltime2[4]);

    end;
  end
  else
  begin
   digit3_3.Caption:= bitstodigit(foltime1[9],foltime1[10],foltime1[11],foltime1[12]);
   digit2_3.Caption:= bitstodigit(foltime1[5],foltime1[6],foltime1[7],foltime1[8]);
   digit1_3.Caption:= bitstodigit(foltime1[1],foltime1[2],foltime1[3],foltime1[4]);

  end;
  followsystem:= bitstodigit('0',folstate[7],folstate[8],folstate[9]); //  1='fita',2 ='fitafin,3='25m1p',4='manual'
  if followsystem='0' then showABCD:=false else showABCD:=true;
  ii:=0;
  if (foltrafic[1] ='1') then ii:=ii+1;
  if (foltrafic[2] ='1') then ii:=ii+1;
  if (foltrafic[3] ='1') then ii:=ii+1;
  if (foltrafic[4] ='1') then ii:=ii+1;
  if (foltrafic[5] ='1') then ii:=ii+1;
  if (foltrafic[6] ='1') then ii:=ii+1;
  if (foltrafic[1] ='0') and (foltrafic[2] ='0') and (foltrafic[3] ='0') and (foltrafic[4] ='0') and (foltrafic[5] ='0') and (foltrafic[6] ='0') then ii:=1;
  if ii<>0 then Turnsperserie:=Shooters div ii;

  if (foltrafic[1] ='1') then followleft:=true else followleft:=false;
  if (foltrafic[2] ='1') then followright:=true else followright:=false;

  if followleft then teststringright.Caption:='left' else teststringright.Caption:='none';
  Archersperturn:=ii;
  if Archersperturn =1 then
  begin
    if (foltrafic[6] ='1') then turnnumber:=1;
    if (foltrafic[5] ='1') then turnnumber:=2;
    if (foltrafic[4] ='1') then turnnumber:=3;
    if (foltrafic[3] ='1') then turnnumber:=4;
    if (foltrafic[2] ='1') then turnnumber:=5;
    if (foltrafic[1] ='1') then turnnumber:=6;

  end
  else
  begin
    if (foltrafic[6] ='1') then turnnumber:=1;
    if (foltrafic[4] ='1') then turnnumber:=2;
    if (foltrafic[2] ='1') then turnnumber:=3;

  end;
  if ((((rightscreen.Checked=true) and( foltrafic[10]='1') and (bitstodigit('0',folstate[7],folstate[8],folstate[9])='2'))or((leftscreen.Checked=true) and( foltrafic[7]='1') and (bitstodigit('0',folstate[7],folstate[8],folstate[9])='2')))and (((bitstodigit('0',folstate[10],folstate[11],folstate[12]))<>'1') and ((bitstodigit('0',folstate[10],folstate[11],folstate[12]))<>'6') ))then state:=2 else
  state:= strtoint(bitstodigit('0',folstate[10],folstate[11],folstate[12]));
  turnnumber:= strtoint(bitstodigit('0',folstate[4],folstate[5],folstate[6])); //  receive turnnumber
  Shooters:=(strtoint(bitstodigit('0',folstate[1],folstate[2],folstate[3]))+1);

  if state<>1 then
  begin
    manualfollowmenuremove:=true;
    views;
  end
  else manualfollowmenuremove:=false;
  if (foltrafic[13] = '1') and (oldsound = '0') then
  Begin
    nrofmanualbeeps:=1;
    if state = 6 then
    begin
      alarmstate:=1; //remember we are in emergency
      emergencytext.Visible:=true;
    end;



    soundsignal;
     oldsound:= foltrafic[13];
  end
  else
  begin
    if (foltrafic[13] = '0') then
    oldsound:= foltrafic[13];
   end;

  if ((bitstodigit(folendnr[9],folendnr[10],folendnr[11],folendnr[12])='15') or (bitstodigit(folendnr[5],folendnr[6],folendnr[7],folendnr[8])='15') ) then Practiseturn:=1 else Practiseturn:=0;
  sernum:=0;
  if (bitstodigit(folendnr[1],folendnr[2],folendnr[3],folendnr[4])<>'15') then sernum:=sernum+(strtoint(bitstodigit(folendnr[1],folendnr[2],folendnr[3],folendnr[4]))) else sernum:=0;
  if (bitstodigit(folendnr[5],folendnr[6],folendnr[7],folendnr[8])<>'15') then sernum:=sernum+(10*(strtoint(bitstodigit(folendnr[5],folendnr[6],folendnr[7],folendnr[8]))));

  if (bitstodigit(folendnr[9],folendnr[10],folendnr[11],folendnr[12])<>'15') then sernum:=sernum+(100*(strtoint(bitstodigit(folendnr[9],folendnr[10],folendnr[11],folendnr[12]))));
  serienumber :=sernum;

  if (folendnr <> oldfolendnr) or (state <> oldstate) or (folstate <> oldfolstate)  or (Shooters <> oldshooters) or (folsecdetails <> oldfolsecdetails)or (folsecdetailssec <> oldfolsecdetailssec)  or (Archersperturn <> oldArchersperturn) then
    begin
      views;
      resizewindownonfinals;
      resizewindow;
      oldfolstate:=folstate;
      oldArchersperturn:=Archersperturn;
      oldstate:=state;
      oldshooters := Shooters;
      oldfolsecdetails:=folsecdetails;
      oldfolsecdetailssec:=folsecdetailssec;
      oldfolendnr:=folendnr;
    end;


  views;
end;

procedure TCountdownform.serialRxData(Sender: TObject);
var Ard, ARD2, BITSS:string;
  calc:integer;
  P : PChar;
  //read serial data
begin
  sleep(30);
  Ard:=serial.ReadData;
  teststringleft.Caption:= ARD;
  BITSS:='0000000000000000';
  ARD2:='000000';
  if archerysystem<>'manual'then

  begin
    if archerysystem = 'follow'then
    begin
      ARD2:='      ';
      If ARD[1]='-' then
      begin
        StringReplace(ARD, '-', '', [rfReplaceAll]);
        BITSS[1]:='1';
        ARD2[1]:='0';

      end
      else
      begin
        BITSS[1]:='0';
        if ((ARD[1]='0')or(ARD[1]='1')or(ARD[1]='2')or(ARD[1]='3')or(ARD[1]='4')or(ARD[1]='5')or(ARD[1]='6')or(ARD[1]='7')or(ARD[1]='8')or(ARD[1]='9'))  then ARD2[1]:=ARD[1];
      end;

      if ((ARD[2]='0')or(ARD[2]='1')or(ARD[2]='2')or(ARD[2]='3')or(ARD[2]='4')or(ARD[2]='5')or(ARD[2]='6')or(ARD[2]='7')or(ARD[2]='8')or(ARD[2]='9'))  then ARD2[2]:=ARD[2];
      if ((ARD[3]='0')or(ARD[3]='1')or(ARD[3]='2')or(ARD[3]='3')or(ARD[3]='4')or(ARD[3]='5')or(ARD[3]='6')or(ARD[3]='7')or(ARD[3]='8')or(ARD[3]='9'))  then ARD2[3]:=ARD[3];
      if ((ARD[4]='0')or(ARD[4]='1')or(ARD[4]='2')or(ARD[4]='3')or(ARD[4]='4')or(ARD[4]='5')or(ARD[4]='6')or(ARD[4]='7')or(ARD[4]='8')or(ARD[4]='9'))  then ARD2[4]:=ARD[4];
      if ((ARD[5]='0')or(ARD[5]='1')or(ARD[5]='2')or(ARD[5]='3')or(ARD[5]='4')or(ARD[5]='5')or(ARD[5]='6')or(ARD[5]='7')or(ARD[5]='8')or(ARD[5]='9'))  then ARD2[5]:=ARD[5];
      if ((ARD[6]='0')or(ARD[6]='1')or(ARD[6]='2')or(ARD[6]='3')or(ARD[6]='4')or(ARD[6]='5')or(ARD[6]='6')or(ARD[6]='7')or(ARD[6]='8')or(ARD[6]='9'))  then ARD2[6]:=ARD[6];
      ARD2:=trim(ARD2);
      ARD2:=StringReplace(ARD2, #32, '', [rfReplaceAll]);
      if ARD2<>'' then calc:=strtoint(ARD2) else calc:=strtoint('0000000000000001') ;
      ARD2:=inttostr(calc);
      if BITSS[1]='1'then calc:=32768-calc;

      if calc >= 16384 then
      begin
        BITSS[2]:='1';
        calc:=calc-16384;
      end
      else
      begin
        BITSS[2]:='0';
      end;
      if calc >= 8192 then
      begin
        BITSS[3]:='1';
        calc:=calc-8192;
      end
      else
      begin
        BITSS[3]:='0';
      end;
      if calc >= 4096 then
      begin
        BITSS[4]:='1';
        calc:=calc-4096;
      end
      else
      begin
        BITSS[4]:='0';
      end;
      if calc >= 2048 then
      begin
        BITSS[5]:='1';
        calc:=calc-2048;
      end
      else
      begin
        BITSS[5]:='0';
      end;
      if calc >= 1024 then
      begin
        BITSS[6]:='1';
        calc:=calc-1024;
      end
      else
      begin
        BITSS[6]:='0';
      end;
      if calc >= 512 then
      begin
        BITSS[7]:='1';
        calc:=calc-512;
      end
      else
      begin
        BITSS[7]:='0';
      end;
      if calc >= 256 then
      begin
        BITSS[8]:='1';
        calc:=calc-256;
      end
      else
      begin
        BITSS[8]:='0';
      end;
      if calc >= 128 then
      begin
        BITSS[9]:='1';
        calc:=calc-128;
      end
      else
      begin
        BITSS[9]:='0';
      end;
      if calc >= 64 then
      begin
        BITSS[10]:='1';
        calc:=calc-64;
      end
      else
      begin
        BITSS[10]:='0';
      end;
      if calc >= 32 then
      begin
        BITSS[11]:='1';
        calc:=calc-32;
      end
      else
      begin
        BITSS[11]:='0';
      end;
      if calc >= 16 then
      begin
        BITSS[12]:='1';
        calc:=calc-16;
      end
      else
      begin
        BITSS[12]:='0';
      end;
      if calc >= 8 then
      begin
        BITSS[13]:='1';
        calc:=calc-8;
      end
      else
      begin
        BITSS[13]:='0';
      end;
      if calc >= 4 then
      begin
        BITSS[14]:='1';
        calc:=calc-4;
      end
      else
      begin
        BITSS[14]:='0';
      end;
      if calc >= 2 then
      begin
        BITSS[15]:='1';
        calc:=calc-2;
      end
      else
      begin
        BITSS[15]:='0';
      end;
      if calc >= 1 then
      begin
        BITSS[16]:='1';
        calc:=calc-1;
      end
      else
      begin
        BITSS[16]:='0';
      end;


      if (BITSS[16]='0') and ((BITSS[15]='0') or (BITSS[14]='1'))  then foltime1:=BITSS;
      if (BITSS[16]='0') and ((BITSS[15]='1') or (BITSS[14]='1'))  then foltime2:=BITSS;

      if (BITSS[16]='1') and (BITSS[15]='0')  then     foltrafic:=BITSS;
      if (BITSS[16]='1') and (BITSS[15]='1') and (BITSS[14]='1') and (BITSS[13]='0')  then folendnr:=BITSS;
      if (BITSS[16]='1') and (BITSS[15]='1') and (BITSS[14]='0') and (BITSS[13]='0')  then folsecdetails:=BITSS;
      if (BITSS[16]='1') and (BITSS[15]='1') and (BITSS[14]='0') and (BITSS[13]='1')  then folsecdetailssec:=BITSS;
      if (BITSS[16]='1') and (BITSS[15]='1') and (BITSS[14]='1') and (BITSS[13]='1')  then folstate:=BITSS;


      teststring.Caption:=foltime1;
      teststringendnr.Caption:=foltime2;
      teststringendnr3.Caption:=foltrafic;
      teststringendnr1.Caption:=folendnr;
      teststringendnr2.Caption:=folsecdetailssec;
      teststringleft.Caption:=folstate;
      if ((serialinput.Checked=true)) then switchfollow;


      views;
      switchfollow;


    end
    else
    begin
    if ARD <> '' then
    begin
      if ARD='1' then playpauze;
      if ARD='2' then stop;
      if ARD='3' then next;
      if ARD='4' then downturn;
      if ARD='5' then upturn;
    end;
    end;
  end
  else
  begin
    if ARD <> '' then
    begin
      if ARD='1' then
      begin
        case HWbutton1.ItemIndex of
          0: setred;
          1: setorange;
          2: setgreen;
          3: onebeep;
          4: twobeeps;
          5: threebeeps;
          6: stopemergency;
        end;
      end;
      if ARD='2' then
      begin
        case HWbutton2.ItemIndex of
          0: setred;
          1: setorange;
          2: setgreen;
          3: onebeep;
          4: twobeeps;
          5: threebeeps;
          6: stopemergency;
        end;
      end;
      if ARD='3' then
      begin
        case HWbutton3.ItemIndex of
          0: setred;
          1: setorange;
          2: setgreen;
          3: onebeep;
          4: twobeeps;
          5: threebeeps;
          6: stopemergency;
        end;
      end;
      if ARD='4' then
      begin
        case HWbutton4.ItemIndex of
          0: setred;
          1: setorange;
          2: setgreen;
          3: onebeep;
          4: twobeeps;
          5: threebeeps;
          6: stopemergency;
        end;
      end;
      if ARD='5' then
      begin
        case HWbutton5.ItemIndex of
          0: setred;
          1: setorange;
          2: setgreen;
          3: onebeep;
          4: twobeeps;
          5: threebeeps;
          6: stopemergency;
        end;
      end;

    end;

  end;

end;

procedure TCountdownform.ABCDperENDChange(Sender: TObject);
begin
  startupscenario.Text:='--';
  views;
end;

procedure TCountdownform.Button6Click(Sender: TObject);
begin
end;

procedure TCountdownform.buzzicon1Click(Sender: TObject);
begin
  onebeep;
end;

procedure TCountdownform.buzzicon2Click(Sender: TObject);
begin
  twobeeps;
end;

procedure TCountdownform.buzzicon3Click(Sender: TObject);
begin
  threebeeps;


end;

procedure TCountdownform.dangerClick(Sender: TObject);
begin
  stopemergency
end;

procedure TCountdownform.finalstimingClick(Sender: TObject);
begin

end;

procedure TCountdownform.fi(Sender: TObject);
begin

end;

procedure TCountdownform.FITAFINlabelClick(Sender: TObject);
begin

end;

procedure TCountdownform.followChange(Sender: TObject);
begin
 archerysystem:='follow';
 initsystemtype;

end;

procedure TCountdownform.followtimerTimer(Sender: TObject);
begin

  NETWORK1.Connect(fromhostrefresh.Caption, portnumber1.Value);
  NETWORK1.SendMessage('CON'+HOSTNAME.Caption);

end;

procedure TCountdownform.fromHOSTChange(Sender: TObject);
begin
  fromhostrefresh.Caption:=fromHOST.Text;
  connectports;
end;

procedure TCountdownform.hideiconsChange(Sender: TObject);
begin
end;

procedure TCountdownform.LANinputChange(Sender: TObject);
begin
  if LANinput.Checked=true then
  begin
    Receivenetworkpanel.visible:=true;
    connectports;
  end
  else
  begin
    Receivenetworkpanel.visible:=false;

  end;
end;

procedure TCountdownform.Followlansettings;
begin
  if LANinput.Checked=true then
  begin
  end;

end;

procedure TCountdownform.LANselectChange(Sender: TObject);
begin
  connectports;
end;

procedure TCountdownform.leftscreenChange(Sender: TObject);
begin
  switchfollow;
end;

procedure TCountdownform.LUDP1Error(const msg: string; aSocket: TLSocket);
begin

end;

procedure TCountdownform.LUDP1Receive(aSocket: TLSocket);
begin

end;

procedure TCountdownform.networktimestampTimer(Sender: TObject);
begin
  if Length(inttostr(SENTLAN6)) > 0 then TLUdp(NETWORK1).SendMessage('TST'+inttostr(SENTLAN6)+chr(13)+chr(10), LADDR_BR); //n

  if Length(inttostr(SENTLAN5)) > 0 then TLUdp(NETWORK1).SendMessage('TST'+inttostr(SENTLAN5)+chr(13)+chr(10), LADDR_BR); //m

  if Length(inttostr(SENTLAN1)) > 0 then TLUdp(NETWORK1).SendMessage('TST'+inttostr(SENTLAN1)+chr(13)+chr(10), LADDR_BR); //i

  if archerysystem='fitafin'then
  begin
    if Length(inttostr(SENTLAN3)) > 0 then TLUdp(NETWORK1).SendMessage('TST'+inttostr(SENTLAN3)+chr(13)+chr(10), LADDR_BR); //k
  end
  else
  begin
    if archerysystem='fita' then
    begin
      if Length(inttostr(SENTLAN4)) > 0 then TLUdp(NETWORK1).SendMessage('TST'+inttostr(SENTLAN4)+chr(13)+chr(10), LADDR_BR); //l
      if Length(inttostr(SENTLAN4b)) > 0 then TLUdp(NETWORK1).SendMessage('TST'+inttostr(SENTLAN4b)+chr(13)+chr(10), LADDR_BR); //l2
    end;


  end;

  if Length(inttostr(SENTLAN2)) > 0 then
  begin

    TLUdp(NETWORK1).SendMessage('TST'+inttostr(SENTLAN2)+chr(13)+chr(10), LADDR_BR); //j
  end;





end;

procedure TCountdownform.nrof1ppractisearrowsChange(Sender: TObject);
begin
  if (nrof1ppractisearrows.value< serienumber)   and (Practiseturn =1) then
  if (nrof1ppractisearrows.value=0) then Practiseturn :=0 else
  begin
    Practiseturn:=1;
    serienumber:=nrof1ppractisearrows.value;

  end;
  startupscenario.Text:='--';
  views;

end;

procedure TCountdownform.onefiveClick(Sender: TObject);
begin
  onefivesystem;
  showseq;
  showtime;
  startupscenario.Text:='--';
end;

procedure TCountdownform.onesixClick(Sender: TObject);
begin
  onesixsystem;
  showseq;
  showtime;
  startupscenario.Text:='--';

end;

procedure TCountdownform.portnumber1Change(Sender: TObject);
begin
  connectports;
end;

procedure TCountdownform.portnumberfollowChange(Sender: TObject);
begin
  Followlansettings;
end;

procedure TCountdownform.portnumberrecChange(Sender: TObject);
begin

end;

procedure TCountdownform.rotate25m1pChange(Sender: TObject);
begin
  views;
end;

procedure TCountdownform.selectport1Change(Sender: TObject);
begin
end;

procedure TCountdownform.serialtimestampTimer(Sender: TObject);

begin
  if (archerysystem<>'follow') or ((archerysystem='follow')and(LANinput.Checked)) then
  begin



  if refreshtiming > 200 then  refreshtiming:=1 else inc(refreshtiming);
  if refreshtiming=7 then serref1:=true;
  if refreshtiming=12 then serref2:=true;
  if refreshtiming=17 then serref3:=true;
  if refreshtiming=22 then serref4:=true;
  if refreshtiming=27 then serref5:=true;
  if refreshtiming=32 then serref6:=true;
  if refreshtiming=37 then serref7:=true;
  if (SENTLAN1<>arduinowrite1) then serint:=1 else  if (SENTLAN2<>arduinowrite2) then serint:=2 else if (SENTLAN3<>arduinowrite3) then serint:=3;
  case serint of
  6: begin
       if (SENTLAN6<>arduinowrite6) or (serref6=true) then serial.WriteData(inttostr(SENTLAN6));
       arduinowrite6:=SENTLAN6;
       serref6:=false;
       serint:=5;
     end;
  5: begin
       if (SENTLAN5<>arduinowrite5) or (serref5=true) then serial.WriteData(inttostr(SENTLAN5));
       arduinowrite5:=SENTLAN5;
       serref5:=false;

       if  archerysystem='fitafin'then serint:=1 else serint:=4;
     end;
  1: begin
       if (SENTLAN1<>arduinowrite1) or (serref1=true) then
       begin
         serial.WriteData(inttostr(SENTLAN1));
       end;

       arduinowrite1:=SENTLAN1;
       serref1:=false;
       serint:=2;
      end;
  3: begin
       if (SENTLAN3<>arduinowrite3) or (serref3=true) then serial.WriteData(inttostr(SENTLAN3));
       arduinowrite3:=SENTLAN3;
       serref3:=false;
       serint:=6;

     end;
  4: begin
       if (SENTLAN4<>arduinowrite4) or (serref4=true) then serial.WriteData(inttostr(SENTLAN4));
       arduinowrite4:=SENTLAN4;
       serref4:=false;
       if Shooters>4 then serint:=7 else serint:=1;

     end;
  7: begin
       if (SENTLAN4b<>arduinowrite7) or (serref7=true) then serial.WriteData(inttostr(SENTLAN4b));
       arduinowrite7:=SENTLAN4b;
       serref7:=false;

       serint:=1;
     end;
  2: begin
       if (SENTLAN2<>arduinowrite2) or (serref2=true) then serial.WriteData(inttostr(SENTLAN2));
       arduinowrite2:=SENTLAN2;
       serref2:=false;
       if archerysystem='fitafin'then serint:=3 else serint:=6;

     end;
  else
     begin
       serint:=1;
     end;
  end;

  end;
end;

procedure TCountdownform.Shooter5Click(Sender: TObject);
begin
  if archerysystem<>'follow' then
  begin
    if Archersperturn=1 then turnnumber:=5;
    if Archersperturn=2 then turnnumber:=3;
    if Archersperturn=3 then turnnumber:=2;


    views;
  end;



end;

procedure TCountdownform.Shooter6Click(Sender: TObject);
begin
  if archerysystem<>'follow' then
  begin
    if Archersperturn=1 then turnnumber:=6;
    if Archersperturn=2 then turnnumber:=3;
    if Archersperturn=3 then turnnumber:=2;

    views;
  end;


end;

procedure TCountdownform.TCP1Accept(aSocket: TLSocket);
begin

end;

procedure TCountdownform.TCP1Receive(aSocket: TLSocket);
var
  s, st2, st3: string;
  svalue:integer;
begin

  if aSocket.GetMessage(s) > 0 then
  teststringleft.Caption:=s;
  if length(s)>=3 then
  begin
    st2:='0000';
    if length(s)=4 then st2:='0';
    if length(s)=5 then st2:='00';
    if length(s)=6 then st2:='000';
    if length(s)=7 then st2:='0000';
    if length(s)=8 then st2:='00000';

    if ((s[1]='T') and (s[2]='S') and (s[3]='T') and (laninput.Checked=true)) then     //timestamp
    begin
      if (s[4]='0') or (s[4]='1') or (s[4]='2') or (s[4]='3') or (s[4]='4') or (s[4]='5') or (s[4]='6') or (s[4]='7') or (s[4]='8') or (s[4]='9') then   st2:='0';
      if (s[5]='0') or (s[5]='1') or (s[5]='2') or (s[5]='3') or (s[5]='4') or (s[5]='5') or (s[5]='6') or (s[5]='7') or (s[5]='8') or (s[5]='9') then   st2:='00';
      if (s[6]='0') or (s[6]='1') or (s[6]='2') or (s[6]='3') or (s[6]='4') or (s[6]='5') or (s[6]='6') or (s[6]='7') or (s[6]='8') or (s[6]='9') then   st2:='000';
      if (s[7]='0') or (s[7]='1') or (s[7]='2') or (s[7]='3') or (s[7]='4') or (s[7]='5') or (s[7]='6') or (s[7]='7') or (s[7]='8') or (s[7]='9') then   st2:='0000';
      if (s[8]='0') or (s[8]='1') or (s[8]='2') or (s[8]='3') or (s[8]='4') or (s[8]='5') or (s[8]='6') or (s[8]='7') or (s[8]='8') or (s[8]='9') then   st2:='00000';

      if (s[4]='0') or (s[4]='1') or (s[4]='2') or (s[4]='3') or (s[4]='4') or (s[4]='5') or (s[4]='6') or (s[4]='7') or (s[4]='8') or (s[4]='9') then   st2[1]:=s[4];
      if (s[5]='0') or (s[5]='1') or (s[5]='2') or (s[5]='3') or (s[5]='4') or (s[5]='5') or (s[5]='6') or (s[5]='7') or (s[5]='8') or (s[5]='9') then   st2[2]:=s[5];
      if (s[6]='0') or (s[6]='1') or (s[6]='2') or (s[6]='3') or (s[6]='4') or (s[6]='5') or (s[6]='6') or (s[6]='7') or (s[6]='8') or (s[6]='9') then   st2[3]:=s[6];
      if (s[7]='0') or (s[7]='1') or (s[7]='2') or (s[7]='3') or (s[7]='4') or (s[7]='5') or (s[7]='6') or (s[7]='7') or (s[7]='8') or (s[7]='9') then   st2[4]:=s[7];
      if (s[8]='0') or (s[8]='1') or (s[8]='2') or (s[8]='3') or (s[8]='4') or (s[8]='5') or (s[8]='6') or (s[8]='7') or (s[8]='8') or (s[8]='9') then   st2[5]:=s[8];


       svalue:=strtoint(st2);
      teststringendnr.Caption:=inttostr(svalue);
      st3:='0000000000000000';
      if svalue>=32768 then
      begin
        st3[1]:='1';
        svalue:=svalue-32768
      end;
      if svalue>=16384 then
      begin
        st3[2]:='1';
        svalue:=svalue-16384
      end;
      if svalue>=8192 then
      begin
        st3[3]:='1';
        svalue:=svalue-8192
      end;
      if svalue>=4096 then
      begin
        st3[4]:='1';
        svalue:=svalue-4096
      end;
      if svalue>=2048 then
      begin
        st3[5]:='1';
        svalue:=svalue-2048
      end;
      if svalue>=1024 then
      begin
        st3[6]:='1';
        svalue:=svalue-1024
      end;
      if svalue>=512 then
      begin
        st3[7]:='1';
        svalue:=svalue-512
      end;
      if svalue>=256 then
      begin
        st3[8]:='1';
        svalue:=svalue-256
      end;
      if svalue>=128 then
      begin
        st3[9]:='1';
        svalue:=svalue-128
      end;
      if svalue>=64 then
      begin
        st3[10]:='1';
        svalue:=svalue-64
      end;
      if svalue>=32 then
      begin
        st3[11]:='1';
        svalue:=svalue-32
      end;
      if svalue>=16 then
      begin
        st3[12]:='1';
        svalue:=svalue-16
      end;
      if svalue>=8 then
      begin
        st3[13]:='1';
        svalue:=svalue-8
      end;
      if svalue>=4 then
      begin
        st3[14]:='1';
        svalue:=svalue-4
      end;
      if svalue>=2 then
      begin
        st3[15]:='1';
        svalue:=svalue-2
      end;
      if svalue>=1 then
      begin
        st3[16]:='1';
        svalue:=svalue-1
      end;
       if (st3[16]='0') and ((st3[15]='0') or (st3[14]='1'))  then foltime1:=st3;
      if (st3[16]='0') and ((st3[15]='1') or (st3[14]='1'))  then foltime2:=st3;

      if (st3[16]='1') and (st3[15]='0')  then     foltrafic:=st3;
      if (st3[16]='1') and (st3[15]='1') and (st3[14]='1') and (st3[13]='0')  then folendnr:=st3;
      if (st3[16]='1') and (st3[15]='1') and (st3[14]='0') and (st3[13]='0')  then folsecdetails:=st3;
      if (st3[16]='1') and (st3[15]='1') and (st3[14]='0') and (st3[13]='1')  then folsecdetailssec:=st3;
      if (st3[16]='1') and (st3[15]='1') and (st3[14]='1') and (st3[13]='1')  then folstate:=st3;


      teststring.Caption:=foltime1;
      teststringendnr.Caption:=foltime2;
      teststringendnr3.Caption:=foltrafic;
      teststringendnr1.Caption:=folendnr;
      teststringendnr2.Caption:=folsecdetailssec;
      teststringleft.Caption:=folstate;
      if ((archerysystem='follow') and (LANinput.Checked=true)) then switchfollow;
    end;
  end;


end;

procedure TCountdownform.TCPfollowAccept(aSocket: TLSocket);
begin
  teststring.Caption:='ConnectOK';
end;

procedure TCountdownform.TCPfollowReceive(aSocket: TLSocket);
var
  s: string;
begin
end;

procedure TCountdownform.threetwoClick(Sender: TObject);
begin
  threetwosystem;
  showseq;
  showtime;
  startupscenario.Text:='--';

end;

procedure TCountdownform.Timer1Timer(Sender: TObject);
begin
  justconnected:=true;
end;

procedure TCountdownform.topbotClick(Sender: TObject);
begin
  topbotsystem;
  showseq;
  showtime;
  startupscenario.Text:='--';

end;

procedure TCountdownform.twothreeChange(Sender: TObject);
begin

end;

procedure TCountdownform.twothreeClick(Sender: TObject);
begin
  twothreesystem;
  showseq;
  showtime;
  startupscenario.Text:='--';

end;

procedure TCountdownform.twotwoChange(Sender: TObject);
begin

end;

procedure TCountdownform.UDP1Error(const msg: string;
  aSocket: TLSocket);
begin

end;

Procedure  TCountdownform.setgreen;
begin
 state:=3;
 nrofmanualbeeps:=nrgreenbuzz.Value;
 manualfollowmenuremove:=true;
 views;
 if nrofmanualbeeps<>0 then soundsignal;
end;

Procedure  TCountdownform.setorange;
begin
 state:=4;
 nrofmanualbeeps:=nrorangebuzz.Value;
 manualfollowmenuremove:=true;
 views;
 if nrofmanualbeeps<>0 then soundsignal;
end;

Procedure  TCountdownform.setred;
begin
 state:=2;
 nrofmanualbeeps:=nrredbuzz.Value;
 manualfollowmenuremove:=true;
 views;
 if nrofmanualbeeps<>0 then soundsignal;

end;
Procedure  TCountdownform.onebeep;
begin
  manualfollowmenuremove:=true;
  nrofmanualbeeps:=1;
  soundsignal;


end;

Procedure  TCountdownform.twobeeps;
begin
  manualfollowmenuremove:=true;
  nrofmanualbeeps:=2;
  soundsignal;


end;

Procedure  TCountdownform.threebeeps;
begin
  manualfollowmenuremove:=true;
  nrofmanualbeeps:=3;
  soundsignal;


end;


procedure TCountdownform.manualgreenClick(Sender: TObject);
begin
  setgreen;
end;

procedure TCountdownform.manualorangeClick(Sender: TObject);
begin
  setorange;
end;

procedure TCountdownform.manualredClick(Sender: TObject);
begin
  setred;
end;

procedure TCountdownform.rightscreenChange(Sender: TObject);
begin
  switchfollow;
end;

procedure TCountdownform.showtargetChange(Sender: TObject);
begin
  if showtarget.Checked=true then number.Visible:=true else number.Visible:=false;
  startupscenario.Text:='--';
  views

end;

procedure TCountdownform.showtargetClick(Sender: TObject);
begin

end;

procedure TCountdownform.soundsignallabel1Click(Sender: TObject);
begin

end;

procedure TCountdownform.followClick(Sender: TObject);
begin
  archerysystem:='follow';
  initsystemtype;

end;

procedure TCountdownform.ManualClick(Sender: TObject);
begin
 archerysystem:='manual';
 initsystemtype;

end;

procedure TCountdownform.manualpannelClick(Sender: TObject);
begin

end;


procedure TCountdownform.arduinoselect1Change(Sender: TObject);
begin
  if initializationstate=false then connect;
end;

procedure TCountdownform.connect_delayTimer(Sender: TObject);
begin
  connect_delay.Enabled:=false;
  connect;
end;

procedure TCountdownform.connect_switch_delayTimer(Sender: TObject);
begin
  oldoutpstate:=0;
  justconnected:=true;
  refreshserial;

  connect_switch_delay.Enabled:=false;
   views;
end;

procedure TCountdownform.FormCreate(Sender: TObject);
begin

end;
procedure  TCountdownform.refreshserial;
begin
  serref1:=true;
  serref2:=true;
  serref3:=true;
  serref4:=true;
  serref5:=true;
  serref6:=true;
  serref7:=true;

end;


procedure TCountdownform.soff;
//shootoff selected
begin
   Shootoff:=1;
   next;
end;




procedure TCountdownform.playpauze;
//play or pause selected
begin
if (archerysystem<>'manual') and (archerysystem<>'follow') then

begin
endtimout.Enabled:=true;
if state<>1 then
begin
  if archerysystem<>'fitafin' then
  begin
    if (FirstTimer.enabled=false)then
    begin
      referencetime:=now+1;
      FirstTimer.enabled:=true ;
      playpauzeicon.Hint:= Paustxt;
    end
    else
    begin
      FirstTimer.enabled:=false ;
      playpauzeicon.Hint:= resumetxt;
    end;
  end
  else
  begin
    if (FirstTimer.enabled=false) and (secondTimer.enabled=false)then
    begin
      referencetime:=now+1;
       if (fitafinarcher='right') then secondTimer.enabled:=true else FirstTimer.enabled:=true ;
       playpauzeicon.Hint:= Paustxt;
    end
    else
    begin
      FirstTimer.enabled:=false ;
      secondTimer.enabled:=false ;
      playpauzeicon.Hint:= resumetxt;
    end;

  end;
end;
views;
end;
end;

procedure TCountdownform.playpausebuttonClick(Sender: TObject);
begin
playpauze;
end;


procedure TCountdownform.orangetimeChange(Sender: TObject);
begin
totaltime.Caption:= inttostr( trunc(orangetime.value)+trunc(greentime.value));
if orangetime.value=-1 then totaltime.Caption:=inttostr(strtoint(totaltime.Caption)+1);
if greentime.value=-1 then totaltime.Caption:=inttostr(strtoint(totaltime.Caption)+1);
showtime;
startupscenario.Text:='--';
end;





procedure TCountdownform.setlanguage;
//put the correct text in the text fields depending on the selected language

var button1index, button2index, button3index, button4index, button5index, button6index:integer; //to remember the itemindex of combobox during content change
begin
 if buffer ='Español' then buffer := 'Espanol';  //the  ñ character can not be used in a txtfilename
 if buffer ='Ελληνικά' then buffer := 'Greek';
 if (buffer = 'English') or (buffer = 'Nederlands') or (buffer = 'Deutsch')  or  (buffer = 'Francais') or (buffer = 'Espanol') or (buffer = 'Italiano') or (buffer = 'Magyar')or (buffer = 'Greek')then
 begin
   AssignFile(langTxtFile, Filespath+'language/'+buffer) ;
   Reset(langTxtFile) ;
   ReadLn(langTxtFile, langbuffer) ;
   serielabel.Caption:=langbuffer;

   ReadLn(langTxtFile, langbuffer) ;
   arrowlabel.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   Practise.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   turnlabel.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   doubleturnslabel.Caption:=langbuffer;


   ReadLn(langTxtFile, langbuffer) ;
   secgrnlabel5.Caption:=langbuffer;
   secgrnlabel3.Caption:=langbuffer;
   secgrnlabel4.Caption:=langbuffer;
   secgrnlabel1.Caption:=langbuffer;
   secgrnlabel2.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   secorlabel5.Caption:=langbuffer;
   secorlabel4.Caption:=langbuffer;
   secorlabel1.Caption:=langbuffer;
   secorlabel2.Caption:=langbuffer;
   secorlabel3.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   secredlabel5.Caption:=langbuffer;
   secredlabel4.Caption:=langbuffer;
   secredlabel1.Caption:=langbuffer;
   secredlabel2.Caption:=langbuffer;
   secredlabel3.Caption:=langbuffer;

   ReadLn(langTxtFile, langbuffer) ;
   sectotlabel5.Caption:=langbuffer;
   sectotlabel4.Caption:=langbuffer;
   sectotlabel1.Caption:=langbuffer;
   sectotlabel2.Caption:=langbuffer;
   sectotlabel3.Caption:=langbuffer;


   ReadLn(langTxtFile, langbuffer) ;
   Archerlabel25m1p.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   shooteronearrow.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   savesettings.Caption:=langbuffer;
   settings.Hint:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   minsec.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   save.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   hideicons.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   speaker.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;

   begin
     F1waitlabel1.Caption:=langbuffer;
     F2waitlabel1.Caption:=langbuffer;
     F3waitlabel1.Caption:=langbuffer;
     F4waitlabel1.Caption:=langbuffer;
     F5waitlabel1.Caption:=langbuffer;
     F6waitlabel1.Caption:=langbuffer;
     F7waitlabel1.Caption:=langbuffer;
     F8waitlabel1.Caption:=langbuffer;
     F9waitlabel1.Caption:=langbuffer;
     F10waitlabel1.Caption:=langbuffer;
     F11waitlabel1.Caption:=langbuffer;
     F12waitlabel1.Caption:=langbuffer;
     F1waitlabel2.Caption:=langbuffer;
     F2waitlabel2.Caption:=langbuffer;
     F3waitlabel2.Caption:=langbuffer;
     F4waitlabel2.Caption:=langbuffer;
     F5waitlabel2.Caption:=langbuffer;
     F6waitlabel2.Caption:=langbuffer;
     F7waitlabel2.Caption:=langbuffer;
     F8waitlabel2.Caption:=langbuffer;
     F9waitlabel2.Caption:=langbuffer;
     F10waitlabel2.Caption:=langbuffer;
     F11waitlabel2.Caption:=langbuffer;
     F12waitlabel2.Caption:=langbuffer;

     varF1waitlabel1.Caption:=langbuffer;
     varF2waitlabel1.Caption:=langbuffer;
     varF3waitlabel1.Caption:=langbuffer;
     varF4waitlabel1.Caption:=langbuffer;
     varF5waitlabel1.Caption:=langbuffer;
     varF6waitlabel1.Caption:=langbuffer;
     varF7waitlabel1.Caption:=langbuffer;
     varF8waitlabel1.Caption:=langbuffer;
     varF9waitlabel1.Caption:=langbuffer;
     varF10waitlabel1.Caption:=langbuffer;
     varF11waitlabel1.Caption:=langbuffer;
     varF12waitlabel1.Caption:=langbuffer;
     varF1waitlabel2.Caption:=langbuffer;
     varF2waitlabel2.Caption:=langbuffer;
     varF3waitlabel2.Caption:=langbuffer;
     varF4waitlabel2.Caption:=langbuffer;
     varF5waitlabel2.Caption:=langbuffer;
     varF6waitlabel2.Caption:=langbuffer;
     varF7waitlabel2.Caption:=langbuffer;
     varF8waitlabel2.Caption:=langbuffer;
     varF9waitlabel2.Caption:=langbuffer;
     varF10waitlabel2.Caption:=langbuffer;
     varF11waitlabel2.Caption:=langbuffer;
     varF12waitlabel2.Caption:=langbuffer;
   end;
   ReadLn(langTxtFile, langbuffer) ;

   begin
     F1Shoottimelabel.Caption:=langbuffer;
     F2Shoottimelabel.Caption:=langbuffer;
     F3Shoottimelabel.Caption:=langbuffer;
     F4Shoottimelabel.Caption:=langbuffer;
     F5Shoottimelabel.Caption:=langbuffer;
     F6Shoottimelabel.Caption:=langbuffer;
     F7Shoottimelabel.Caption:=langbuffer;
     F8Shoottimelabel.Caption:=langbuffer;
     F9Shoottimelabel.Caption:=langbuffer;
     F10Shoottimelabel.Caption:=langbuffer;
     F11Shoottimelabel.Caption:=langbuffer;
     F12Shoottimelabel.Caption:=langbuffer;

     varF1Shoottimelabel.Caption:=langbuffer;
     varF2Shoottimelabel.Caption:=langbuffer;
     varF3Shoottimelabel.Caption:=langbuffer;
     varF4Shoottimelabel.Caption:=langbuffer;
     varF5Shoottimelabel.Caption:=langbuffer;
     varF6Shoottimelabel.Caption:=langbuffer;
     varF7Shoottimelabel.Caption:=langbuffer;
     varF8Shoottimelabel.Caption:=langbuffer;
     varF9Shoottimelabel.Caption:=langbuffer;
     varF10Shoottimelabel.Caption:=langbuffer;
     varF11Shoottimelabel.Caption:=langbuffer;
     varF12Shoottimelabel.Caption:=langbuffer;
   end;
   ReadLn(langTxtFile, langbuffer) ;

   begin
     F1SOtimelabel.Caption:=langbuffer;
     F2SOtimelabel.Caption:=langbuffer;
     F3SOtimelabel.Caption:=langbuffer;
     F4SOtimelabel.Caption:=langbuffer;
     F5SOtimelabel.Caption:=langbuffer;
     F6SOtimelabel.Caption:=langbuffer;
     F7SOtimelabel.Caption:=langbuffer;
     F8SOtimelabel.Caption:=langbuffer;
     F9SOtimelabel.Caption:=langbuffer;
     F10SOtimelabel.Caption:=langbuffer;
     F11SOtimelabel.Caption:=langbuffer;
     F12SOtimelabel.Caption:=langbuffer;

     varF1SOtimelabel.Caption:=langbuffer;
     varF2SOtimelabel.Caption:=langbuffer;
     varF3SOtimelabel.Caption:=langbuffer;
     varF4SOtimelabel.Caption:=langbuffer;
     varF5SOtimelabel.Caption:=langbuffer;
     varF6SOtimelabel.Caption:=langbuffer;
     varF7SOtimelabel.Caption:=langbuffer;
     varF8SOtimelabel.Caption:=langbuffer;
     varF9SOtimelabel.Caption:=langbuffer;
     varF10SOtimelabel.Caption:=langbuffer;
     varF11SOtimelabel.Caption:=langbuffer;
     varF12SOtimelabel.Caption:=langbuffer;
   end;

   ReadLn(langTxtFile, langbuffer) ;
   oneone.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   onetwo.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   onethree.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   onefour.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   twotwo.Caption:=langbuffer;

   ReadLn(langTxtFile, langbuffer) ;
   F1description.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   F2description.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   F3description.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   F4description.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   F5description.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   F6description.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   F7description.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   F8description.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   F9description.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   F10description.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   F11description.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   F12description.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;


   ReadLn(langTxtFile, langbuffer) ;
   practiselabel.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   FITA.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   FITAFINlabel.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   onepijl.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   timing1p.Caption:=langbuffer;
   fitatimingbox.Caption:=langbuffer;
   finalstiming.Caption:=langbuffer;
   groupfinarrow.Caption:='';
   groupfinend.Caption:='';
   ReadLn(langTxtFile, langbuffer) ;
   so.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   timeseqpanel.Caption:=langbuffer;
   clockicon.Hint:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   dbltime.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   dblturn.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   Show.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   showtarget.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   ReadLn(langTxtFile, langbuffer) ;
   ReadLn(langTxtFile, langbuffer) ;
   targetID.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   timeperturn.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   timeperend.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   Turns_per_end.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   BCDtoROG2label.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   finalchoose.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   savevarF1button.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   savevarF2button.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   savevarF3button.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   savevarF4button.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   savevarF5button.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   savevarF6button.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   savevarF7button.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   savevarF8button.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   savevarF9button.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   savevarF10button.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   savevarF11button.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   savevarF12button.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   abcd25m1p.caption:=langbuffer;
   ReadLn(langTxtFile, precnthintfirst) ;
   ReadLn(langTxtFile, Mintext) ;
   beforestarttxt2.Caption:=Mintext;
   precountminutelabel.Caption:=Mintext;
   ReadLn(langTxtFile, Minabr) ;

   ReadLn(langTxtFile, langbuffer) ;
   tabscr.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   tabsound.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   tabscen.caption:=langbuffer;
   selectscenariolabel.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   tabprecnt.caption:=langbuffer;
   preptime.Hint:=langbuffer;
   countdowntostart.Hint:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   tablang.caption:=langbuffer;
   selectlanguagelabel.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   TLgroup.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   usetraffic.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   showhints.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   selectsoundlabel.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   testsound.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   precountcaptionlabel.caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   starttocd.caption:=langbuffer;
   ReadLn(langTxtFile, Menudisap) ;
   menudisap1.caption:=Menudisap;
   menudisap2.caption:=Menudisap;
   ReadLn(langTxtFile, Sectext) ;
   disapsec1.Caption:= Sectext;
   disapsec2.Caption:= Sectext;
   ReadLn(langTxtFile, langbuffer) ;
   seriedown.hint:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   serieup.hint:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   stopicon.Hint:= langbuffer;
   ReadLn(langTxtFile, Paustxt) ;
   playpauzeicon.Hint:= Paustxt;
   ReadLn(langTxtFile, resumetxt) ;
   ReadLn(langTxtFile, NXTstart) ;
   nexticon.Hint:= NXTstart;
   ReadLn(langTxtFile, NXTnext) ;
   ReadLn(langTxtFile, NXTstop) ;
   ReadLn(langTxtFile, langbuffer) ;
   usb.Hint:= langbuffer;
   ReadLn(langTxtFile, prevarch) ;
   turndown.Hint:= prevarch;
   shooteronearrow.Hint:= prevarch;
   ReadLn(langTxtFile, nextarch) ;
   turnup.Hint:= nextarch;
   shooteronearrownr.Hint:= nextarch;
   ReadLn(langTxtFile, langbuffer) ;
   serienr.Hint:= langbuffer;
   Practise.Hint:= langbuffer;
   ReadLn(langTxtFile, ActAtxt) ;
   ReadLn(langTxtFile, ActBtxt) ;
   ReadLn(langTxtFile, ActCtxt) ;
   ReadLn(langTxtFile, ActDtxt) ;
   ReadLn(langTxtFile, langbuffer) ;
   resizeicon.Hint:= langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   closeicon.Hint:= langbuffer;
   ReadLn(langTxtFile, Mainhint1) ;
   nexthelp.Caption:= Mainhint1;
   ReadLn(langTxtFile, Mainhint2) ;
   chooselabel.Caption:=Mainhint2;
   ReadLn(langTxtFile, langbuffer) ;
   TLleft.caption:= langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   TLright.caption:= langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   beforestarttxt1.caption:= langbuffer;
   ReadLn(langTxtFile, selectright) ;
   greyright.Hint:=selectright;
   ReadLn(langTxtFile, selectleft) ;
   greyleft.Hint:=selectleft;
   ReadLn(langTxtFile, Mainhint3) ;
   ReadLn(langTxtFile, Mainhint4) ;

   ReadLn(langTxtFile, Connectingstring) ;
   ReadLn(langTxtFile, Connectedstring) ;
   ReadLn(langTxtFile, Cardnotfoundstring) ;
   ReadLn(langTxtFile, Cardstring) ;
   ReadLn(langTxtFile, langbuffer) ;
   precountalways.caption:= langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   ABCDperEND.caption:= langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   abouttab.caption:= langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   hardwaretab.caption:= langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   manualred.Hint:=langbuffer;
   TLredlefton.Hint:=langbuffer;
   TLredleftoff.Hint:=langbuffer;
   TLredrighton.Hint:=langbuffer;
   TLredrightoff.Hint:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   manualorange.Hint:=langbuffer;
   TLorangelefton.Hint:=langbuffer;
   TLorangeleftoff.Hint:=langbuffer;
   TLorangerighton.Hint:=langbuffer;
   TLorangerightoff.Hint:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   manualgreen.Hint:=langbuffer;
   TLgrnlefton.Hint:=langbuffer;
   TLgrnleftoff.Hint:=langbuffer;
   TLgrnrighton.Hint:=langbuffer;
   TLgrnrightoff.Hint:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   buzzicon1.Hint:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   buzzicon2.Hint:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   buzzicon3.Hint:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   danger.Hint:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   soundsignallabel1.Caption:=langbuffer;
   soundsignallabel2.Caption:=langbuffer;
   soundsignallabel3.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   redbox.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   orangebox.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   greenbox.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   exthwbox.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   button1.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   button2.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   button3.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   button4.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   button5.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   Manual.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   follow.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   emergencytext.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   followexplanation.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   leftrightbox.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   leftscreen.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   rightscreen.Caption:=langbuffer;

   button1index:=HWbutton1.ItemIndex;
   button2index:=HWbutton2.ItemIndex;
   button3index:=HWbutton3.ItemIndex;
   button4index:=HWbutton4.ItemIndex;
   button5index:=HWbutton5.ItemIndex;

   HWbutton1.Items.Delete(0);HWbutton2.Items.Delete(0);HWbutton3.Items.Delete(0);HWbutton4.Items.Delete(0);HWbutton5.Items.Delete(0);
   HWbutton1.Items.Delete(0);HWbutton2.Items.Delete(0);HWbutton3.Items.Delete(0);HWbutton4.Items.Delete(0);HWbutton5.Items.Delete(0);
   HWbutton1.Items.Delete(0);HWbutton2.Items.Delete(0);HWbutton3.Items.Delete(0);HWbutton4.Items.Delete(0);HWbutton5.Items.Delete(0);
   HWbutton1.Items.Delete(0);HWbutton2.Items.Delete(0);HWbutton3.Items.Delete(0);HWbutton4.Items.Delete(0);HWbutton5.Items.Delete(0);
   HWbutton1.Items.Delete(0);HWbutton2.Items.Delete(0);HWbutton3.Items.Delete(0);HWbutton4.Items.Delete(0);HWbutton5.Items.Delete(0);
   HWbutton1.Items.Delete(0);HWbutton2.Items.Delete(0);HWbutton3.Items.Delete(0);HWbutton4.Items.Delete(0);HWbutton5.Items.Delete(0);
   HWbutton1.Items.Delete(0);HWbutton2.Items.Delete(0);HWbutton3.Items.Delete(0);HWbutton4.Items.Delete(0);HWbutton5.Items.Delete(0);
   HWbutton1.Text:='';
   HWbutton2.Text:='';
   HWbutton3.Text:='';
   HWbutton4.Text:='';
   HWbutton5.Text:='';

   ReadLn(langTxtFile, langbuffer) ;
   HWbutton1.Items.AddStrings(langbuffer);
   HWbutton2.Items.AddStrings(langbuffer);
   HWbutton3.Items.AddStrings(langbuffer);
   HWbutton4.Items.AddStrings(langbuffer);
   HWbutton5.Items.AddStrings(langbuffer);
   ReadLn(langTxtFile, langbuffer) ;
   HWbutton1.Items.AddStrings(langbuffer);
   HWbutton2.Items.AddStrings(langbuffer);
   HWbutton3.Items.AddStrings(langbuffer);
   HWbutton4.Items.AddStrings(langbuffer);
   HWbutton5.Items.AddStrings(langbuffer);
   ReadLn(langTxtFile, langbuffer) ;
   HWbutton1.Items.AddStrings(langbuffer);
   HWbutton2.Items.AddStrings(langbuffer);
   HWbutton3.Items.AddStrings(langbuffer);
   HWbutton4.Items.AddStrings(langbuffer);
   HWbutton5.Items.AddStrings(langbuffer);
   ReadLn(langTxtFile, langbuffer) ;
   HWbutton1.Items.AddStrings(langbuffer);
   HWbutton2.Items.AddStrings(langbuffer);
   HWbutton3.Items.AddStrings(langbuffer);
   HWbutton4.Items.AddStrings(langbuffer);
   HWbutton5.Items.AddStrings(langbuffer);
   ReadLn(langTxtFile, langbuffer) ;
   HWbutton1.Items.AddStrings(langbuffer);
   HWbutton2.Items.AddStrings(langbuffer);
   HWbutton3.Items.AddStrings(langbuffer);
   HWbutton4.Items.AddStrings(langbuffer);
   HWbutton5.Items.AddStrings(langbuffer);
   ReadLn(langTxtFile, langbuffer) ;
   HWbutton1.Items.AddStrings(langbuffer);
   HWbutton2.Items.AddStrings(langbuffer);
   HWbutton3.Items.AddStrings(langbuffer);
   HWbutton4.Items.AddStrings(langbuffer);
   HWbutton5.Items.AddStrings(langbuffer);
   ReadLn(langTxtFile, langbuffer) ;
   HWbutton1.Items.AddStrings(langbuffer);
   HWbutton2.Items.AddStrings(langbuffer);
   HWbutton3.Items.AddStrings(langbuffer);
   HWbutton4.Items.AddStrings(langbuffer);
   HWbutton5.Items.AddStrings(langbuffer);

   HWbutton1.ItemIndex:=button1index;
   HWbutton2.ItemIndex:=button2index;
   HWbutton3.ItemIndex:=button3index;
   HWbutton4.ItemIndex:=button4index;
   HWbutton5.ItemIndex:=button5index;

   ReadLn(langTxtFile, langbuffer) ;
   viewleft.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   viewright.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   finarrow.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   inputbox.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   serialinput.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   LANinput.Caption:=langbuffer;
   ReadLn(langTxtFile, ActEtxt) ;
   ReadLn(langTxtFile, ActFtxt) ;
   ReadLn(langTxtFile, langbuffer) ;
   onefive.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   onesix.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   twothree.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   threetwo.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   rotate25m1p.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   ReadLn(langTxtFile, langbuffer) ;
  ReadLn(langTxtFile, langbuffer) ;
   PCnameLabel.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   LANselect.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   serverportlabel1.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   USBserialbox.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   arduinoselect1.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   topbot.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   TOPshooterlet.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   TOPshootertxt.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   BOTshooterlet.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   BOTshootertxt.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   practiselabel25m1p1.Caption:=langbuffer;
   ReadLn(langTxtFile, langbuffer) ;
   varF1Button.Caption:=langbuffer+' F1';
   varF2Button.Caption:=langbuffer+' F2';
   varF3Button.Caption:=langbuffer+' F3';
   varF4Button.Caption:=langbuffer+' F4';
   varF5Button.Caption:=langbuffer+' F5';
   varF6Button.Caption:=langbuffer+' F6';
   varF7Button.Caption:=langbuffer+' F7';
   varF8Button.Caption:=langbuffer+' F8';
   varF9Button.Caption:=langbuffer+' F9';
   varF10Button.Caption:=langbuffer+' F10';
   varF11Button.Caption:=langbuffer+' F11';
   varF12Button.Caption:=langbuffer+' F12';
   F1Button.Caption:=langbuffer+' shift-F1';
   F2Button.Caption:=langbuffer+' shift-F2';
   F3Button.Caption:=langbuffer+' shift-F3';
   F4Button.Caption:=langbuffer+' shift-F4';
   F5Button.Caption:=langbuffer+' shift-F5';
   F6Button.Caption:=langbuffer+' shift-F6';
   F7Button.Caption:=langbuffer+' shift-F7';
   F8Button.Caption:=langbuffer+' shift-F8';
   F9Button.Caption:=langbuffer+' shift-F9';
   F10Button.Caption:=langbuffer+' shift-F10';
   F11Button.Caption:=langbuffer+' shift-F11';
   F12Button.Caption:=langbuffer+' shift-F12';

   CloseFile(langTxtFile) ;
 end;
 if initializationstate=false then connect;
 resizewindowall;
 views;
end;
procedure TCountdownform.initialize;
//initializes the system at startup (setting lanuage, archery system, etc)
begin
  {$IFDEF Unix}
 //SDL Stuff

  if ((SDL_InitSubSystem(SDL_INIT_AUDIO) < 0)) then
  begin

    ShowMessage('Could not initialize SDL Audio' );

    SDL_Quit;
    exit;
  end;
  audio_rate := 22050;
  audio_format := AUDIO_S16SYS;
  audio_channels := 2;
  audio_buffers := 4096;
  if(Mix_OpenAudio(audio_rate, audio_format, audio_channels, audio_buffers) <> 0) then
  begin
	ShowMessage('Unable to initialize audio');
  end;
  // END SDL Stuff
  {$ENDIF}

  SystemParametersInfo(SPI_SETSCREENSAVEACTIVE, 0, nil, 0); //disable the screensaver
  initializationstate:=true;

  //folowing lines are meant to set the language of an initial version which doesn't have settings yet.
  //in combination with a different banner.bmp file, it can be used for a version of a specific club.
  //one and only one language should contain 'yes'. The others 'no'
  dutchlang:='no';     //yes means initial version has dutch language
  frenchlang:='no';    //yes means initial version has french language
  englang:='yes';      //yes means initial version has English language

  //settings depending to OS
  {$IFDEF Windows}
  mag:=1.000;
  //some font sizez in the menu's need to be bigger in windows as in Linux

  oneone.Font.Size:=8;
  onetwo.font.size:=8;
  onethree.Font.Size:=8;
  onefour.Font.Size:=8;
  twotwo.font.Size:=8;

  topbot.Font.Size:=8;
  onefive.Font.Size:=8;
  onesix.Font.Size:=8;
  twothree.Font.Size:=8;
  threetwo.Font.Size:=8;


  doubleturnslabel.font.size:=8;
  ABCDperEND.font.size:=8;
  dbltime.Font.size:=8;
  dblturn.font.size:=8;
  doubleseq.font.Size:=8;
  doubletime.font.size:=8;
  practiselabel.font.size:=8;
  targetID.font.size:=8;
  fintarget.font.size:=8;
  finarrow.font.size:=8;
  timeperturn.font.size:=8;
  timeperend.font.size:=8;
  Turns_per_end.font.size:=8;
  Archerlabel25m1p.font.size:=8;
  secgrnlabel1.font.Size:=8;
  secgrnlabel2.font.Size:=8;
  secgrnlabel3.font.Size:=8;
  secgrnlabel4.font.Size:=8;
  secgrnlabel5.font.Size:=8;
  secorlabel1.font.Size:=8;
  secorlabel2.font.Size:=8;
  secorlabel3.font.Size:=8;
  secorlabel4.font.Size:=8;
  secorlabel5.font.Size:=8;
  secredlabel1.font.Size:=8;
  secredlabel2.font.Size:=8;
  secredlabel3.font.Size:=8;
  secredlabel4.font.Size:=8;
  secredlabel5.font.Size:=8;
  sectotlabel1.font.Size:=8;
  sectotlabel2.font.Size:=8;
  sectotlabel3.font.Size:=8;
  sectotlabel4.font.Size:=8;
  sectotlabel5.font.Size:=8;

  FITAFINlabel.Font.Size:=7;
  //helptext has different size in linux or windows
   nexthelp.Color:=clCream;
   nexthelp.Font.Color:=clBlack;
   nexthelp.Font.Size:=8;
   nexthelp.Height:=-11;
   nexthelp.Constraints.MinHeight:=14  ;
   chooselabel.Color:=clCream;
   chooselabel.Font.Color:=clBlack;
   chooselabel.Font.Size:=8;
   chooselabel.Height:=-11;
   chooselabel.Constraints.MinHeight:=14  ;

  {$ENDIF}
  Filespath:='';
  {$IFDEF Unix}

  Filespath:=(ParamStr(0));
  Delete(Filespath,LastDelimiter('/',Filespath),25);
  Filespath:=Filespath+'/';
  mag:=0.83;
  K8055select.Enabled:=false; //K8055 is not supported yet by linux


  //some font sizez in the menu's need to be smaller in Linux as in Windows
  oneone.Font.Size:=8;
  onetwo.font.size:=8;
  onethree.Font.Size:=8;
  onefour.Font.Size:=8;
  twotwo.font.Size:=8;

  topbot.Font.Size:=8;
  onefive.Font.Size:=8;
  onesix.Font.Size:=8;
  twothree.Font.Size:=8;
  threetwo.Font.Size:=8;


  doubleturnslabel.font.size:=7;
  ABCDperEND.font.size:=8;
  dbltime.Font.size:=8;
  dblturn.font.size:=8;
  doubleseq.font.Size:=8;
  doubletime.font.size:=8;
  practiselabel.font.size:=8;
  targetID.font.size:=8;
  fintarget.font.size:=8;
  finarrow.font.size:=8;
  timeperturn.font.size:=7;
  timeperend.font.size:=7;
  Turns_per_end.font.size:=8;
  Archerlabel25m1p.font.size:=8;
  secgrnlabel1.font.Size:=8;
  secgrnlabel2.font.Size:=8;
  secgrnlabel3.font.Size:=8;
  secgrnlabel4.font.Size:=8;
  secgrnlabel5.font.Size:=8;
  secorlabel1.font.Size:=8;
  secorlabel2.font.Size:=8;
  secorlabel3.font.Size:=8;
  secorlabel4.font.Size:=8;
  secorlabel5.font.Size:=8;
  secredlabel1.font.Size:=8;
  secredlabel2.font.Size:=8;
  secredlabel3.font.Size:=8;
  secredlabel4.font.Size:=8;
  secredlabel5.font.Size:=8;
  sectotlabel1.font.Size:=8;
  sectotlabel2.font.Size:=8;
  sectotlabel3.font.Size:=8;
  sectotlabel4.font.Size:=8;
  sectotlabel5.font.Size:=8;
  FITAFINlabel.Font.Size:=6;
  //helptext has different size in linux or windows
  nexthelp.Color:=clinfoBK;
  nexthelp.Font.Color:=clinfotext;
  nexthelp.Font.Size:=11;
  nexthelp.Height:=23;
  nexthelp.Constraints.MinHeight:=23  ;
  chooselabel.Color:=clinfoBK;
  chooselabel.Font.Color:=clinfotext;
  chooselabel.Font.Size:=11;
  chooselabel.Height:=23;
  chooselabel.Constraints.MinHeight:=23  ;
  {$ENDIF}
  leftreceivedvalue:='1010000000000000';
  rightreceivedvalue:='1010000000000000';
  trafficreceiveddata:='0000000000000000';
  foltime1:='0000000000000000';
  foltime2:='0000000000000000';
  foltrafic:='0000000000000000';
  folsecdetails:='0000000000000000';
  folsecdetailssec:='0000000000000000';
  folendnr:='0000000000000000';
  folstate:='0000000000000000';
  manualfollowmenuremove:=false;
  serref1:=false;
  serref2:=false;
  serref3:=false;
  serref4:=false;
  serref5:=false;
  serref6:=false;
  serref7:=false;

  NETWORK1:=LUDP1;

  //settings of the banner
  bannerAR:=(2000/260);
  bannerscaling:=108;    //height of picture
  nobannerfile:='no'; // It is expected that a banner.bmp file is available to show the banner at the bottom of the screen
  if FileExistsUTF8(Filespath+'banner.bmp')=false then   //banner.bmp does not exist, so the text is shown in stead of a banner
  begin  //there is no banner file
    nobannerfile:='yes';

    websitename.Visible:=true;

    archeryclock.visible:=true;    //show label because clock is not ticking
    show_commercial.Enabled:=true;
    bannerpicture.Visible:=false;     //no file to show
  end
  else
  begin  //there is a banner file
    bannerpicture.Picture.LoadFromFile(Filespath+'banner.bmp');

    bannerpicture.Visible:=true;
    websitename.Visible:=false;
  end;


  //Next settings are meant for usage of external hardware to switch serial
  //for timing reasons only the delta needs to be sent to the hardware
  //For example, when red light is on, there is a check needed if the light was already on
  //only when old vallue was off, a signal needs to be sent to swith red on.
  //Below, the initial old values are set to off
  buzzeronold:=0;



  //initialize  values
  labelnr:=10;     // to start commecial initially with www.....
  nrofturns:=1;
  times:=1;
  turnsss:=1;
  referencetime:=now;
  Practiseturn:=1; //practice enabled
  archerysystem:='fita';
  Shootoff:=0;
  buzzeron:=0;
  nrofbeeps:=0;
  nrofmanualbeeps:=0;


  countdowntimer:=0;
  Shooters:=4;              //shooters per serie
  serienumber:=1;            //current serie
  turnnumber:=1;             //current turn
  shooternumber:=1;         //shooter who is
  turnsperserie:=4;          //number of turns per serie
  Archersperturn:=1;          //number of archers per turn
  state:=1;
  alarmstate:=0;             //no emergency yet
  shootercolor:=clLime;
  nonshootercolor:=clGray;
  waitcolor:=clGray;
  redcolor:=clRed;
  orangecolor:=clYellow;
  greencolor:=clLime;

  lamp_red_left_on_off:=0;
  lamp_red_right_on_off:=0;
  lamp_orange_left_on_off:=0;
  lamp_orange_right_on_off:=0;
  lamp_green_left_on_off:=0;
  lamp_green_right_on_off:=0;

  LampA_on_off:=0;
  LampB_on_off:=0;
  LampC_on_off:=0;
  LampD_on_off:=0;
  LampE_on_off:=0;
  LampF_on_off:=0;
  Not_LampA_on_off:=0;
  Not_LampB_on_off:=0;
  Not_LampC_on_off:=0;
  Not_LampD_on_off:=0;
  Not_LampE_on_off:=0;
  Not_LampF_on_off:=0;

  //initialyze variable scenarois
  for mode := 1 to 12 do
  begin
    Scenario:='F'+inttostr(mode);
    if FileExistsUTF8(Filespath+'scenarios/'+scenario)=true then  //if Fx scenario is stored from an earlier session, get the details from file and store in program
    begin
      AssignFile(scenariotextfile, Filespath+'scenarios/'+scenario) ;
      getsetting;
    end
    else              //Doesnt exist from previous sessions, so use defoults (F1 uses shift F1, F2 uses shift F2, etc.)
    begin
      Setsettings;
    end;
    //Show variable scenarios in scenario menu.
    if scenario='F1' then showF1;
    if scenario='F2' then showF2;
    if scenario='F3' then showF3;
    if scenario='F4' then showF4;
    if scenario='F5' then showF5;
    if scenario='F6' then showF6;
    if scenario='F7' then showF7;
    if scenario='F8' then showF8;
    if scenario='F9' then showF9;
    if scenario='F10' then showF10;
    if scenario='F11' then showF11;
    if scenario='F12' then showF12;
  end;
  timeperturn.Checked:=true;

    //next section is about the default settings at startup. The file 'settings' is read that contains the initial settings of the user.
  //First a check will be done if the settings file exist. if it doesnt exist, it mean it is the first time the program is used.
  //in that case a file with default settings will be created.
  if FileExistsUTF8(Filespath+'settings')=false then
  begin
     AssignFile(settingsfile, Filespath+'settings') ;
     ReWrite(settingsfile) ;
     if dutchlang='no' then writeln(settingsfile,'English') else writeln(settingsfile,'Nederlands');
     writeln(settingsfile,'Sec') ;   //show seconds, not minutes
     writeln(settingsfile,'nonHide') ; //do not hide icons
     writeln(settingsfile,'Buzzer') ;   //initially, the buzzer via speaker is enabled
     writeln(settingsfile,'shiftF5') ; //initial scenario is shiftF5
     writeln(settingsfile,'Hint');     //initially the hints are shown
     Writeln(settingsfile,'TL');     //initially, the trafic lights are not shown on the screen
     Writeln(settingsfile,'TLright');   //initially, the position of the trafic lights is on the right side of the screen
     writeln(settingsfile,'buzzer1') ;  //initial sound used is buzzr.wav
     writeln(settingsfile,'4') ;        //Initially the time before the match starts is 4 minutes
     {$IFDEF Windows}
     writeln(settingsfile,'K8055') ;      //K8055 port is default selected. System still functions without hardware
     {$ENDIF}
     {$IFDEF Unix}
     writeln(settingsfile,'na') ;
     {$ENDIF}
     writeln(settingsfile,'COM1') ;       //serial port arduino
     writeln(settingsfile,'nonarduino1'); //Arduino is not selected by default because it is not plug and play
     writeln(settingsfile,'noPRECOUNT') ;   //countdown to start match is not starting after every end
     writeln(settingsfile,'4665') ;       //default port adres
     writeln(settingsfile,'nonLAN');    //LAN is not selected by default because it is not plug and play

     CloseFile(settingsfile) ;

  end;

  //load startup settings and initialyze the program with these settings
  begin
    AssignFile(settingsfile, Filespath+'settings') ;
    Reset(settingsfile) ;
    ReadLn(settingsfile, buffer) ;
    lang.Text:=buffer;
    setlanguage;
    lang.Text:=buffer;
    ReadLn(settingsfile, buffer) ;
    if buffer = 'Min' then
    begin
      minsec.ItemIndex:=1;
      minutes.Checked:=true;
    end
    else
    begin
      minsec.ItemIndex:=0;
      seconds.Checked:=true;
    end;
    ReadLn(settingsfile, buffer) ;
    if buffer = 'Hide' then
    begin
      Hideicons.checked:=true;
    end
    else
    begin
      Hideicons.checked:=false;
    end;
    ReadLn(settingsfile, buffer) ;
    if buffer = 'Buzzer' then
    begin
      speaker.checked:=true;
    end
    else
    begin
      speaker.checked:=false;
    end;
    ReadLn(settingsfile, buffer) ;
    startupscenario.Text:=buffer;
    buffer2:=buffer;
    changescenario;
    startupscenario.Text:=buffer2;

    if not EOF(settingsfile)then
    begin
      ReadLn(settingsfile, buffer) ;
      if buffer = 'Hint' then
      begin
        showhints.checked:=true;
      end
      else
      begin
        showhints.checked:=false;
      end;

      ReadLn(settingsfile, buffer) ;
      if buffer = 'TL' then
      begin
        usetraffic.checked:=true;
      end
      else
      begin
        usetraffic.checked:=false;
      end;
      ReadLn(settingsfile, buffer) ;
      if buffer = 'TLleft' then
      begin
        TLleft.checked:=true;
      end
      else
      begin
        TLright.checked:=true;
      end;
      ReadLn(settingsfile, buffer) ;
      soundselect.Text:=buffer;
      WavFilename:=PChar(Filespath+'sounds/'+wavbuffer+'.wav');
      ReadLn(settingsfile, buffer) ;
      tostart.value:=strtoint(buffer);
      ReadLn(settingsfile, buffer) ;
      if buffer = 'K8055' then
      begin
        K8055select.Checked := true;
      end
      else
      begin
        K8055select.Checked := false;
      end;
      ReadLn(settingsfile, buffer) ;
      serialport1.Text:=buffer;
      serial.Device:=buffer;
      ReadLn(settingsfile, buffer) ;
      if buffer = 'arduino1' then
      begin

        arduinoselect1.Checked := true;
      end
      else
      begin
        arduinoactive_at_init :=false;
        arduinoselect1.Checked := false;
        serial.Active:=false;
      end;

    end;
    if not EOF(settingsfile)then
    begin
      ReadLn(settingsfile, buffer) ;
      if buffer = 'PRECOUNT' then
      begin
        precountalways.Checked := true;
      end;

    end;

    if not EOF(settingsfile)then
    begin
      ReadLn(settingsfile, buffer) ;
      portnumber1.Value:=strtoint(buffer);
      //UDP1.Port:=strtoint(buffer);
      ReadLn(settingsfile, buffer) ;
      if buffer = 'nonLAN' then
      begin

        LANselect.Checked := false;
      end
      else
      begin

        LANselect.Checked := true;

      end;
    end;


    CloseFile(settingsfile) ;
    updatemenu;

    hide2;
  end;

    //Initialize the menus

  fitapanel.Top:=-2;
  onearrowpanel.Top:=-2;
  manualpannel.Top:=-2;
  followpannel.Top:=-2;
  fitafinpanel.Top:=-2;
  groupfinend.Left:=48;
  groupfinarrow.Left:=48;
  finalteamturns.Left:=4;
  finalturns.left:= 4;
  finalteamturns.top:=178;
  finalturns.top:=178;
  Turns_per_end.top:=182;
  Turns_per_end.Left:=52;
  timeseqpanel.Height:=320
  ;
  getPCname;

  savesettings.height:=175; //height of the settings menu
  //Calculate the different total times (Green and red together)
  totaltime.Caption:= inttostr( trunc(orangetime.value)+trunc(greentime.value));
  if orangetime.value=-1 then totaltime.Caption:=inttostr(strtoint(totaltime.Caption)+1);
  if greentime.value=-1 then totaltime.Caption:=inttostr(strtoint(totaltime.Caption)+1);

  totaltimeso.Caption:= inttostr( trunc(orangetimeso.value)+trunc(greentimeso.value));
  totaltime1p.Caption:= inttostr( trunc(orangetime1p.value)+trunc(greentime1p.value));
  totalfinal.Caption:= inttostr( trunc(orangefinal.value)+trunc(greenfinal.value));
  totalfinalend.Caption:= inttostr( trunc(orangefinalend.value)+trunc(greenfinalend.value));
  //Languagetab always active at startup
  SettingsTabs.ActivePage:=tablang;



  //initial settings for fita finals
  fitafinarcher:='none';    //not decided yet which archer starts

  //Show what needs to be visible in current mode/setting

  //Change size to current resolution
  resizewindow;
  initializationstate:=false;

  connect_delay.Enabled:=true;
end;


procedure TCountdownform.FormActivate(Sender: TObject);
begin
  initialize;

end;

procedure TCountdownform.changescenario;
begin
   for mode := 1 to 12 do
   begin
     Scenario:='F'+inttostr(mode);
     if buffer ='shiftF'+inttostr(mode) then Setsettings;
     if buffer ='F'+inttostr(mode) then


     begin
       if FileExistsUTF8(Filespath+'scenarios/'+scenario)=true then
       begin
         AssignFile(scenariotextfile, Filespath+'scenarios/'+scenario) ;
         getsetting;
       end
       else
       begin
         Setsettings;
       end;

     end;

   end;
   if buffer ='--' then
   begin
     if FileExistsUTF8(Filespath+'scenarios/'+'gen') =true then
     begin
       AssignFile(scenariotextfile, Filespath+'scenarios/'+'gen') ;
       getsetting;
     end;


   end;

end;


procedure TCountdownform.timingsettingsClick(Sender: TObject);
  //show timing menu or remove it when pressing the timing button
begin
  manualfollowmenuremove:=false;
  if (timeseqpanel.visible=false)then
  begin
    timeseqpanel.visible:=true ;
    savesettings.Visible:=false;
    prepsetpanel.Visible:=false;
  end
  else
  begin
    timeseqpanel.visible:=false ;
  end;
  views;
  menuremovesec:=5;

end;

procedure TCountdownform.serienrClick(Sender: TObject);
begin
  if  (archerysystem<>'follow')  then
  begin
    serienumber:=1;
    turnnumber:=1;

    if (archerysystem='fita') and (practiseturns.Value<>0) then Practiseturn:=1;

    if (archerysystem='25m1p') and (nrof1ppractisearrows.Value<>0) then Practiseturn:=1;


    views;

  end;


end;

procedure TCountdownform.greentimeChange(Sender: TObject);
begin
  totaltime.Caption:= inttostr( trunc(orangetime.value)+trunc(greentime.value));
  if orangetime.value=-1 then totaltime.Caption:=inttostr(strtoint(totaltime.Caption)+1);
  if greentime.value=-1 then totaltime.Caption:=inttostr(strtoint(totaltime.Caption)+1);

  showtime;
  startupscenario.Text:='--';
end;

procedure TCountdownform.oneonesystem;
begin
  if (Practiseturn=1) and (serienumber >Practiseturns.value) then serienumber:=Practiseturns.value;
  showABCD:=true;
  Shooters:=1;
  Turnsperserie:=1;
  Archersperturn:=1;
  if turnnumber >  Turnsperserie then turnnumber:= Turnsperserie;

  views;

end;


procedure TCountdownform.oneoneClick(Sender: TObject);
begin
  oneonesystem;
  showseq;
  showtime;
  startupscenario.Text:='--';
end;


procedure TCountdownform.onetwosystem;
begin
  
  if (Practiseturn=1) and (serienumber >Practiseturns.value) then serienumber:=Practiseturns.value;

  showABCD:=true;
  Shooters:=2;
  Turnsperserie:=2;
  Archersperturn:=1;
  if turnnumber >  Turnsperserie then turnnumber:= Turnsperserie;
  views;

end;


procedure TCountdownform.onetwoClick(Sender: TObject);
begin
  onetwosystem;
  showseq;
  showtime;
  startupscenario.Text:='--';
end;

procedure TCountdownform.onethreesystem;
begin

 if (Practiseturn=1) and (serienumber >Practiseturns.value) then serienumber:=Practiseturns.value;

 showABCD:=true;
Shooters:=3;
Turnsperserie:=3;
Archersperturn:=1;
if turnnumber >  Turnsperserie then turnnumber:= Turnsperserie;
views;


end;


procedure TCountdownform.onethreeClick(Sender: TObject);
begin
  onethreesystem;
  showseq;
  showtime;
  startupscenario.Text:='--';
end;

procedure TCountdownform.onefoursystem;
begin

 if (Practiseturn=1) and (serienumber >Practiseturns.value) then serienumber:=Practiseturns.value;

 showABCD:=true;
Shooters:=4;
Turnsperserie:=4;
Archersperturn:=1;
if turnnumber >  Turnsperserie then turnnumber:= Turnsperserie;
views;

end;

procedure TCountdownform.onefourClick(Sender: TObject);
begin
  onefoursystem;
  showseq;
  showtime;
  startupscenario.Text:='--';
end;

procedure TCountdownform.twotwosystem;
begin

 if (Practiseturn=1) and (serienumber >Practiseturns.value) then serienumber:=Practiseturns.value;
 showABCD:=true;

Shooters:=4;
Turnsperserie:=2;
Archersperturn:=2;
if turnnumber >  Turnsperserie then turnnumber:= Turnsperserie;
views;

end;

procedure TCountdownform.twotwoClick(Sender: TObject);
begin
twotwosystem;
showseq;
showtime;
startupscenario.Text:='--';
end;

procedure TCountdownform.onefivesystem;
begin

  if (Practiseturn=1) and (serienumber >Practiseturns.value) then serienumber:=Practiseturns.value;

  showABCD:=true;
  Shooters:=5;
  Turnsperserie:=5;
  Archersperturn:=1;
  if turnnumber >  Turnsperserie then turnnumber:= Turnsperserie;
  views;


end;

procedure TCountdownform.onesixsystem;
begin

  if (Practiseturn=1) and (serienumber >Practiseturns.value) then serienumber:=Practiseturns.value;

  showABCD:=true;
  Shooters:=6;
  Turnsperserie:=6;
  Archersperturn:=1;
  if turnnumber >  Turnsperserie then turnnumber:= Turnsperserie;
  views;


end;
procedure TCountdownform.twothreesystem;
begin

  if (Practiseturn=1) and (serienumber >Practiseturns.value) then serienumber:=Practiseturns.value;

  showABCD:=true;
  Shooters:=6;
  Turnsperserie:=3;
  Archersperturn:=2;
  if turnnumber >  Turnsperserie then turnnumber:= Turnsperserie;
  views;


end;

procedure TCountdownform.threetwosystem;
begin

  if (Practiseturn=1) and (serienumber >Practiseturns.value) then serienumber:=Practiseturns.value;

  showABCD:=true;
  Shooters:=6;
  Turnsperserie:=2;
  Archersperturn:=3;
  if turnnumber >  Turnsperserie then turnnumber:= Turnsperserie;
  views;


end;
procedure TCountdownform.topbotsystem;
begin

  if (Practiseturn=1) and (serienumber >Practiseturns.value) then serienumber:=Practiseturns.value;
  showABCD:=false;
  Shooters:=2;
  Turnsperserie:=2;
  Archersperturn:=1;
  if turnnumber >  Turnsperserie then turnnumber:= Turnsperserie;
  views;


end;


procedure TCountdownform.downserie;
//one end down
begin
  if Practiseturn=1 then
  begin
    if serienumber >1 then serienumber:=serienumber-1;
  end
  else

  begin
    if serienumber >1 then serienumber:=serienumber-1 else
    if archerysystem<>'fitafin' then
    begin
      if (archerysystem='fita') and (practiseturns.Value<>0) then
      begin
        serienumber:=Practiseturns.value;
        Practiseturn:=1;
      end;
      if (archerysystem='25m1p') and (nrof1ppractisearrows.Value<>0) then
      begin
        serienumber:=nrof1ppractisearrows.Value;
        Practiseturn:=1;
      end;
    end;
  end;
  views;
end;

procedure TCountdownform.decreaseseriebuttonClick(Sender: TObject);
begin
  downserie;
end;

procedure TCountdownform.upserie;
//one end up
begin


if Practiseturn=1 then
  if ((archerysystem='fita') and (serienumber=Practiseturns.value)) or ((archerysystem='25m1p') and (serienumber=nrof1ppractisearrows.Value))then

  begin
    serienumber:=1;
    Practiseturn:=0;
  end
  else
  begin
    serienumber:=serienumber+1;
  end
else
if (archerysystem<>'fitafin') or (((serienumber<finalturns.Value)and (timeperturn.checked=true))or((serienumber<finalteamturns.Value)and (timeperturn.checked=false))) then  serienumber:=serienumber+1;
views;
end;

procedure TCountdownform.increaseseriebuttonClick(Sender: TObject);
begin


upserie;
end;

procedure TCountdownform.downturn;

//one turn down
begin
  if archerysystem='fitafin' then selectleftarcher else
  begin
    if turnnumber =1 then
    begin
      turnnumber:=turnsperserie;

      if Practiseturn=1 then
      begin
        if serienumber >1 then serienumber:=serienumber-1;
      end
      else

      begin
        if serienumber >1 then serienumber:=serienumber-1 else
        begin
          if (archerysystem='fita') and (practiseturns.Value<>0) then
          begin
            serienumber:=Practiseturns.value;
            Practiseturn:=1;
          end;
          if (archerysystem='25m1p') and (nrof1ppractisearrows.Value<>0) then
          begin
            serienumber:=nrof1ppractisearrows.Value;
            Practiseturn:=1;
          end;


        end;
      end;

  


end
else turnnumber:=turnnumber-1;

views;
end;
end;
procedure TCountdownform.decreaseshooterbuttonClick(Sender: TObject);
begin
 downturn;
end;

procedure TCountdownform.upturn;
//one turn up
begin
  if archerysystem='fitafin' then selectrightarcher else
  begin
    if turnnumber =turnsperserie then
    begin
      turnnumber:=1;
      if Practiseturn=1 then
      if ((archerysystem='fita') and (serienumber=Practiseturns.value)) or ((archerysystem='25m1p') and (serienumber=nrof1ppractisearrows.Value))then
      begin
        serienumber:=1;
        Practiseturn:=0;
      end
      else
      begin
        serienumber:=serienumber+1;
      end
      else
      serienumber:=serienumber+1;
    end
    else turnnumber:=turnnumber+1;
  end;
  views;
end;

procedure TCountdownform.increaseshooterbuttonClick(Sender: TObject);
begin
upturn;
end;

procedure TCountdownform.minutesClick(Sender: TObject);
//activate the change between minute or seconds selection
begin
resizewindow;
views;
end;

procedure TCountdownform.secondsClick(Sender: TObject);
//activate the change between minute or seconds selection
begin
resizewindow;
views;
end;

procedure TCountdownform.stop;
// stop function selected (via "S", stop button, etc.
begin
  if (archerysystem<>'manual') and (archerysystem<>'follow') and (endtimout.Enabled=false) then
  begin
            endtimout.Enabled:=true;
            FirstTimer.enabled:=false ;
            secondTimer.enabled:=false ;
            if state <> 5 then
            begin
              state:=1;
              soundsignal;
            end;
            state:=1;

            countdowntimer:=0;
            countdowntimer2:=0;
            Shootoff:=0;

            fitafinarcher:='none';
            fitafinstartarcher:='none';
            if finarrow.Checked=true then leftrightzoom.Enabled:=true;

            views;
  end;


end;

procedure TCountdownform.stopemergency;
// emergency stop function selected (via "E", ).
begin
  manualfollowmenuremove:=true;
  alarmstate:=1; //remember we are in emergency
  emergencytext.Visible:=true;

  if (archerysystem<>'manual') and (archerysystem<>'follow') then
  begin

            FirstTimer.enabled:=false ;
            secondTimer.enabled:=false ;
            if ((state <> 1) and (state <> 2) and (state <> 5) and (turnnumber =turnsperserie)) then
            begin
              state:=6;
              finalyzeturn;
              //soundsignal;

            end
            else
            begin
              state:=6;
              soundsignal;
            end;
            state:=1;

            countdowntimer:=0;
            countdowntimer2:=0;
            Shootoff:=0;

            fitafinarcher:='none';
            fitafinstartarcher:='none';
            if finarrow.Checked=true then leftrightzoom.Enabled:=true;
            //leftrightzoom.Enabled:=true;

  end
  else
  begin
    state:=1;
    nrofmanualbeeps:=4;
    soundsignal;

  end;
  views;

end;


procedure TCountdownform.nextfinal;
//nextfinal is used in finalrounds for switching between archers.
//switching is depending of arrow number (only after the last arrow, stop switching
//also depending to right or left archer and depending if time per turn or time per arrow is selected
begin
  endtimout.Enabled:=true;
  if ((((serienumber>=finalturns.value) and (timeperturn.checked=true))or((serienumber>=finalteamturns.Value) and (timeperturn.checked=false)) )and(((fitafinarcher='right') and (fitafinstartarcher = 'left')  )or ((fitafinarcher='left') and (fitafinstartarcher = 'right'))))then
  begin       //last archer ready
    state:=1;
    soundsignal;
    fitafinarcher:='none';
    fitafinstartarcher:='none';
  end
  else    //next archer or team
  begin

    if fitafinarcher='right'then  //if rightside archer was active, switch over to left side archer
    begin
      soundsignal;
      fitafinarcher:='left';
      FirstTimer.enabled:=true ;
      secondTimer.enabled:=false ;
      if timeperturn.checked=true then
      begin

        if serienumber=finalturns.value then countdowntimer2:=0 else countdowntimer2:= (orangefinal.Value +greenfinal.value);
        state:=3;
      end
      else
      begin
        if serienumber=finalteamturns.value then countdowntimer2:=0 else if countdowntimer2=1 then countdowntimer2:=0;
        if countdowntimer > orangefinalend.Value then state:=3 else state:=4;

      end;
      if (fitafinstartarcher = 'left')and(((serienumber<finalturns.value)and(timeperturn.checked=true))or((serienumber<finalteamturns.value)and(timeperturn.checked=false))) then serienumber:=serienumber+1;
    end
    else
    if fitafinarcher<>'none'then
    begin  //if leftside archer was active, switch over to right side archer
      soundsignal;
      fitafinarcher:='right';
      FirstTimer.enabled:=false;
      secondTimer.enabled:=true ;
      if timeperturn.checked=true then
      begin
        if serienumber=finalturns.value then countdowntimer:=0 else countdowntimer:= (orangefinal.Value +greenfinal.value);
        state:=3;
      end
      else
      begin
        if serienumber=finalteamturns.value then countdowntimer:=0 else if countdowntimer=1 then countdowntimer:=0;
        if countdowntimer2 > orangefinalend.Value then state:=3 else state:=4;
      end;
      if (fitafinstartarcher = 'right')and(((serienumber<finalturns.value)and(timeperturn.checked=true))or((serienumber<finalteamturns.value)and(timeperturn.checked=false))) then serienumber:=serienumber+1;
    end;
  end;
  if fitafinarcher='none' then
  begin
    FirstTimer.enabled:=false;
    secondTimer.enabled:=false ;
    countdowntimer2:=0;
    countdowntimer:=0;
    state:=1;
    serienumber:=1;
    views;
  end;
  //leftrightzoom.Enabled:=true;
  if finarrow.Checked=true then leftrightzoom.Enabled:=true;
end;

procedure TCountdownform.next;
begin
//when next is selected the window changes in a bar-less window. On the current position
  leftalign:=countdownform.Left;  //remember horizontal position
  topalign:=countdownform.Top;     //remember vertical position
  countdownform.borderstyle:=bsnone;  //remove bar/frame
  countdownform.Left:=leftalign;     //restore horizontal position
  countdownform.Top:=topalign;       //restore vertical position
  if (archerysystem <> 'manual') and (archerysystem<>'follow') and (alarmstate<>1) then
  begin


  if (archerysystem='fitafin') and (endtimout.Enabled=false) then  //actions in final round are different than other rounds
  begin
    referencetime:=Now; //time starts from zero, so need to catch the current time since the system clock is th reference

    if fitafinarcher='left' then
    begin

      FirstTimer.enabled:=false ;
      FirstTimer.enabled:=true ;

    end;

    if fitafinarcher='right' then
    begin

      secondTimer.enabled:=false ;
      secondTimer.enabled:=true ;

    end;
    if fitafinarcher<>'none' then
    //result of 'next' is depending on the state of the timer.
    begin
    case state of
    1:begin     //wait state
      if endtimout.Enabled=false then  //to prevent double press
      begin
        if fitafinarcher='left' then
        begin
          FirstTimer.enabled:=true ;
        end;
        if fitafinarcher='right' then
        begin
          secondTimer.enabled:=true ;
        end;
        state:=2;  //after wait state, timer goes always to red state
        soundsignal;  //start sound signal
        if (fitafinarcher='left') then
        begin
          if timeperturn.checked=true then
          begin
            countdowntimer:= redfinal.Value;
            countdowntimer2:= (orangefinal.Value +greenfinal.value) ;
          end
          else
          begin
            countdowntimer:= redfinalend.Value;
            countdowntimer2:= (orangefinalend.Value +greenfinalend.value);

          end;
        end;
        if (fitafinarcher='right') then
        begin
          if timeperturn.checked=true then
          begin
            countdowntimer2:= redfinal.Value;
            countdowntimer:= (orangefinal.Value +greenfinal.value);
          end
          else
          begin
            countdowntimer2:= redfinalend.Value;
            countdowntimer:= (orangefinalend.Value +greenfinalend.value) ;
          end;
        end;
      end;
    end;
    2:begin //no action if state is 2 (red state) because timer has to run till state 3 without intervention.
    end;
    3:begin  //green
      nextfinal;//means all archers in this turn are ready, continue with next turn
    end;
    4:begin  //yellow
      nextfinal; //means all archers in this turn are ready, continue with next turn
    end;


    end;
    end;
  end
  else  //non-final run
  begin

    if endtimout.Enabled=false then   //prevent doublepress

    if ((FirstTimer.enabled=false)and ((state=2) or (state=3) or (state=4))) then playpauze else
    begin
      referencetime:=Now; //next key  means new timing start, so need to measure current time from system clock for reference.

      FirstTimer.enabled:=false ; //for a fresh start
      FirstTimer.enabled:=true ;
      case state of
      1:begin  //wait state, waiting for start signal
        if endtimout.Enabled=false then
        begin
          FirstTimer.enabled:=true ;
          state:=2; //after wait state starts red state
          soundsignal;    //start sound
          //time for red is depending on system and stored time
          if (archerysystem='fita') and (Shootoff=0) then
          begin
            if redtime.Value = -1 then
            begin
              countdowntimer:=0;
              playpauze;
            end
            else countdowntimer:= redtime.Value;

          end;


          if (archerysystem='25m1p') then countdowntimer:= redtime1p.Value;
          if (archerysystem='fita') and (Shootoff=1) then countdowntimer:= redtimeso.Value;
        end;

      end;
      2:begin //no action if state is 2 (red state) because timer has to run till state 3 without intervention.

      end;
      3:begin

        finalyzeturn;       // green, ending this turn
      end;
      4:begin

        finalyzeturn;       // orange, ending this turn
      end;
      5:begin  //state countdown to start of match    next means start the match
        if endtimout.Enabled=false then   //to prevent double pressing
        begin
          FirstTimer.enabled:=false ;
          FirstTimer.enabled:=true ;
          state:=2;         //next state is red state
          soundsignal;      //activate state
          //red time is depending on system and settings
          if (archerysystem='fita') and (Shootoff=0) then
          begin
            if redtime.Value = -1 then
            begin
              countdowntimer:=0;
              playpauze;
            end
            else countdowntimer:= redtime.Value;

          end;


          if (archerysystem='25m1p') then countdowntimer:= redtime1p.Value;
          if (archerysystem='fita') and (Shootoff=1) then countdowntimer:= redtimeso.Value;
        end;

      end;

    End;  {End Case1}

    views;  //change the screen as result of the new state
    end;

  end;
  end;
end;


procedure TCountdownform.startnextbuttonClick(Sender: TObject);
begin
next;

end;

procedure TCountdownform.buzzerTimerTimer(Sender: TObject);
//this timer is meant to use for the buszzer. depending on the number of beeps, the buzzer needs to switch on or of after interval of buzzertimer
{$IFDEF Unix}
var

  Player: TProcessUTF8;
  PlayerPath: String;
  PlayerParams: String;
{$ENDIF}
begin  //buzzeron
  if buzzeron=1 then
  begin
    buzzeron:=0;
    nrofbeeps:=nrofbeeps-1;
    emergencytext.Visible:=false;
    if nrofbeeps= 0 then alarmstate:=0; // allarmstate (if ther is one) always ends after the last beep
  end
  else
  begin
    buzzeron:=1;
    if alarmstate=1 then  emergencytext.Visible:=true else emergencytext.Visible:=false;

    WavFilename:=PChar(LowerCase(Filespath+'sounds/'+wavbuffer+'.wav'));
   //Writeln(WavFilename);
    {$IFDEF Windows}
    if speaker.checked=true then sndPlaySound(WavFilename, snd_Async or snd_NoDefault);
    {$ENDIF}
    {$IFDEF Unix}
    begin

           /// SDL Stuff
     wave := Nil;

    wave := Mix_LoadWAV(WavFilename);
    if(wave = Nil) then
    begin
	ShowMessage('Unable to load WAV file');
    end;

    channel := Mix_PlayChannel(-1, wave, 0);
    if(channel = -1) then
    begin
	ShowMessage('Unable to play WAV file');
    end
    end;

    {$ENDIF}

  end;
  views;
  if nrofbeeps =0 then
  begin
    buzzertimer.Enabled:=false;

  end;

end;

procedure TCountdownform.windowsize;
//changes the windowsize (pressed left top button or esc button
begin
if countdownform.borderstyle=bsSizeable then
begin
  countdownform.borderstyle:=bsnone;
  countdownform.WindowState:=wsMaximized;
end
else
begin
  leftalign:=countdownform.Left;
  topalign:=countdownform.Top;

  Countdownform.Width:=640;
  countdownform.Height:=480;

  countdownform.borderstyle:=bsSizeable;
  countdownform.WindowState:=wsnormal;
  countdownform.Left:=leftalign;
  countdownform.Top:=topalign;
end;

end;

procedure TCountdownform.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

//detect keys pressed on kexboard
begin
 if (Key = VK_SPACE) then next;
 if (Key = VK_NEXT)and (archerysystem<>'fitafin') then next;
 if (Key = VK_NEXT)and (archerysystem='fitafin') then
 begin
   if  fitafinstartarcher='none' then selectrightarcher else  next;
 end;

 if (Key = VK_PRIOR)and(archerysystem<>'fitafin') then
 begin
   //downturn;
   stopemergency;

   //if preptime.Visible=true then starttostart;
 end;
 if (Key = VK_PRIOR)and(archerysystem='fitafin') then
 begin
   if  fitafinstartarcher='none' then selectleftarcher else  selectnonearcher;
 end;

 if (Key = VK_UP) then upserie;
 if (Key = VK_DOWN) then downserie;
 if (Key = VK_RIGHT) then upturn;
 if (Key = VK_LEFT) then downturn;
 if (Key = VK_ESCape) then windowsize;
 if (Key = 83) and (timeseqpanel.visible=false) and (savesettings.Visible=false) then stop;
 if (Key = 80) and (timeseqpanel.visible=false) and (savesettings.Visible=false) then playpauze;
 if ((Key = 69) )and (timeseqpanel.visible=false) and (savesettings.Visible=false)then stopemergency;
 if (Key = 49) then
 begin
  if (FirstTimer.enabled=false) and  (timeseqpanel.visible=false) and (savesettings.Visible=false) then
  begin
    nrofSOarrows:=1;
    soff;
  end;
 end;
 if (Key = 50) then
 begin
  if (FirstTimer.enabled=false) and  (timeseqpanel.visible=false) and (savesettings.Visible=false) then
  begin
    nrofSOarrows:=2;
    soff;
  end;
 end;
 if (Key = 51) then
 begin
  if (FirstTimer.enabled=false) and  (timeseqpanel.visible=false) and (savesettings.Visible=false) then
  begin
    nrofSOarrows:=3;
    soff;
  end;
 end;
 if (Key = 52) then
 begin
  if (FirstTimer.enabled=false) and  (timeseqpanel.visible=false) and (savesettings.Visible=false) then
  begin
    nrofSOarrows:=4;
    soff;
  end;
 end;
 if (Key = 53) then
 begin
  if (FirstTimer.enabled=false) and  (timeseqpanel.visible=false) and (savesettings.Visible=false) then
  begin
    nrofSOarrows:=5;
    soff;
  end;
 end;
 if (Key = 54) then
 begin
  if (FirstTimer.enabled=false) and  (timeseqpanel.visible=false) and (savesettings.Visible=false) then
  begin
    nrofSOarrows:=6;
    soff;
  end;
 end;

 if (Key = 67) and (timeseqpanel.visible=false) and (savesettings.Visible=false) then
 begin
   if (preptime.Visible=true) then starttostart;
 end;

 if (Key = 72) and (timeseqpanel.visible=false) and (savesettings.Visible=false) then
 begin
   if hideicons.checked=true then hideicons.checked:=false else hideicons.checked:=true;
   views;
 end;
 if (Key = 77)  and (timeseqpanel.visible=false) and (savesettings.Visible=false) then
 begin
   if minsec.itemindex=1 then minsec.itemindex:=0 else minsec.itemindex:=1;
 end;
 if (Key = VK_F1) and (Shift = [ssShift]) then
 begin
   scenario:='F1';
   Setsettings;
 end;
 if (Key = VK_F2) and (Shift = [ssShift])  then
 begin
   scenario:='F2';
   Setsettings;
 end;
 if (Key = VK_F3) and (Shift = [ssShift])  then
 begin
   scenario:='F3';
   Setsettings;
 end;
 if (Key = VK_F4) and (Shift = [ssShift])  then
 begin
   scenario:='F4';
   Setsettings;
 end;
 if (Key = VK_F5) and (Shift = [ssShift])  then
 begin
   scenario:='F5';
   Setsettings;
 end;
 if (Key = VK_F6) and (Shift = [ssShift])  then
 begin
   scenario:='F6';
   Setsettings;
 end;
 if (Key = VK_F7) and (Shift = [ssShift])  then
 begin
   scenario:='F7';
   Setsettings;
 end;
 if (Key = VK_F8) and (Shift = [ssShift])  then
 begin
   scenario:='F8';
   Setsettings;
 end;
 if (Key = VK_F9) and (Shift = [ssShift])  then
 begin
   scenario:='F9';
   Setsettings;
 end;
 if (Key = VK_F10) and (Shift = [ssShift])  then
 begin
   scenario:='F10';
   Setsettings;
 end;
 if (Key = VK_F11) and (Shift = [ssShift])  then
 begin
   scenario:='F11';
   Setsettings;
 end;
 if (Key = VK_F12) and (Shift = [ssShift])  then
 begin
   scenario:='F12';
   Setsettings;
 end;


 if (Key = VK_F1)and (Shift <> [ssShift]) then
 begin
   scenario:='F1';
   setvarsettings;
 end;
 if (Key = VK_F2)and (Shift <> [ssShift]) then
 begin
   scenario:='F2';
   setvarsettings;
 end;
 if (Key = VK_F3)and (Shift <> [ssShift]) then
 begin
   scenario:='F3';
   setvarsettings;
 end;
 if (Key = VK_F4)and (Shift <> [ssShift]) then
 begin
   scenario:='F4';
   setvarsettings;
 end;
 if (Key = VK_F5)and (Shift <> [ssShift]) then
 begin
   scenario:='F5';
   setvarsettings;
 end;
 if (Key = VK_F6)and (Shift <> [ssShift]) then
 begin
   scenario:='F6';
   setvarsettings;
 end;
 if (Key = VK_F7)and (Shift <> [ssShift]) then
 begin
   scenario:='F7';
   setvarsettings;
 end;
 if (Key = VK_F8)and (Shift <> [ssShift]) then
 begin
   scenario:='F8';
   setvarsettings;
 end;
 if (Key = VK_F9)and (Shift <> [ssShift]) then
 begin
   scenario:='F9';
   setvarsettings;
 end;
 if (Key = VK_F10)and (Shift <> [ssShift]) then
 begin
   scenario:='F10';
   setvarsettings;
 end;
 if (Key = VK_F11)and (Shift <> [ssShift]) then
 begin
   scenario:='F11';
   setvarsettings;
 end;
 if (Key = VK_F12)and (Shift <> [ssShift]) then
 begin
   scenario:='F12';
   setvarsettings;
 end;
end;

procedure TCountdownform.stopbuttonClick(Sender: TObject);
begin
stop;
end;

procedure TCountdownform.startupdelayTimer(Sender: TObject);

//This timer is meant to use at startup of the program. To be sure fullscreen mode is enabled, and hardware gets connected at startup.

begin
  countdownform.borderstyle:=bsnone;
  if arduinoactive_at_init=true then arduinoselect1.Checked := true;

  startupdelay.enabled:=false;
end;

procedure TCountdownform.closeiconClick(Sender: TObject);
var i,j:longint;
begin
 i:=

 1 shl 0+ //trafic light data (not digits)
 0 shl 1+ // 0 is standard red orange green and ABCD. (No ABCD sequence details
 0 shl 2+ //buzzer off
 0 shl 3+ 0 shl 4+ 0 shl 5+ 0 shl 6+ 0 shl 7+ 0 shl 8+ 0 shl 9+ 0 shl 10+ 0 shl 11+ 0 shl 12+ 0 shl 13+     //traffic lamps and ABCD lamps off
 0 shl 14+ 0 shl 15 //nr archers 0

;
 j:=
 0 shl 0+ //digits data (traffic lights)
 0 shl 1+ 1 shl 2+ //buzzer offboth sides
 0 shl  3+    //no dots
 0 shl  4+ 1 shl  5+ 0 shl  6+ 1 shl  7+ //right digit
 0 shl  8+ 1 shl  9+ 0 shl 10+ 1 shl 11+ //middle digit
 0 shl 12+ 1 shl 13+ 0 shl 14+ 1 shl 15  //left digit

;
serial.WriteData(inttostr(i));
sleep(50);
serial.WriteData(inttostr(j));
sleep(50);

{$IFDEF Windows}

if not DisableOtherFunctionCall then WriteAllDigital(0);
  OutputAnalogChannel(1,0);
  OutputAnalogChannel(2,0);
{$ENDIF}

sleep(50);
  Close;


end;

procedure TCountdownform.endtimoutTimer(Sender: TObject);
//endtimout is meant to prevent double pressing the space bar or other triggers to go to next archer.
begin
  endtimout.Enabled:=false;
end;

Procedure TCountdownform.connect;
var h,i,j,m:longint;
begin





  h:=-1;
 {$IFDEF Windows}  //K8055 not yet supported by linux
  if K8055select.Checked=true then

  begin
    connect_switch_delay.Enabled:=true;
    USBconnect.Caption:=Connectingstring;
    CardAddr:=0;
    h:= OpenDevice(CardAddr);
    if h=-1 then CardAddr:=1;
    h:= OpenDevice(CardAddr);
    case h of
      0..3:
      begin
        inputtimer.enabled:=true;
        inputtimernext.enabled:=true;
        rememberK8055i:=0;
        rememberK8055E:=0;
        rememberK8055F:=0;
      end;
      -1:
      begin
        inputtimer.enabled:=false;
        inputtimernext.enabled:=false;

      end;
    end;
  end
  else
  begin
    if not DisableOtherFunctionCall then WriteAllDigital(0);
    OutputAnalogChannel(1,0);
    OutputAnalogChannel(2,0);

    CloseDevice;
  end;

  {$ENDIF}

  if arduinoselect1.Checked=true then
  begin

     serial.Active:=true;
     serialtimestamp.Enabled:=true;
     connect_switch_delay.Enabled:=true;
    inputtimer.enabled:=true;
    if ((h= -1) and (arduinoselect1.Checked=true)) then  USBconnect.Caption:=Cardstring+' v3 '+Connectedstring;
    if ((h<>-1) and (arduinoselect1.Checked=true)) then  USBconnect.Caption:=Cardstring+' v2.'+inttostr(h)+', v3 '+Connectedstring;

  end
  else
  begin
    serialtimestamp.Enabled:=false;
    i:=

    1 shl 0+ //trafic light data (not digits)
    0 shl 1+ // 0 is standard red orange green and ABCD. (No ABCD sequence details
    0 shl 2+ //buzzer off
    0 shl 3+ 0 shl 4+ 0 shl 5+ 0 shl 6+ 0 shl 7+ 0 shl 8+ 0 shl 9+ 0 shl 10+ 0 shl 11+ 0 shl 12+ 0 shl 13+     //traffic lamps and ABCD lamps off
    0 shl 14+ 0 shl 15 //nr archers 0

   ;

    m:=   //end details

    1 shl 0+
    1 shl 1+
    1 shl 2+
    0 shl 3+
    0 shl  4+ 1 shl  5+ 0 shl  6+ 1 shl  7+
    0 shl  8+ 1 shl  9+ 0 shl 10+ 1 shl 11+
    0 shl 12+ 1 shl 13+ 0 shl 14+ 1 shl 15

   ;

    j:=
    0 shl 0+ //digits data (traffic lights)
    0 shl 1+ 1 shl 2+ //buzzer offboth sides
    0 shl  3+    //no dots
    0 shl  4+ 1 shl  5+ 0 shl  6+ 1 shl  7+ //right digit
    0 shl  8+ 1 shl  9+ 0 shl 10+ 1 shl 11+ //middle digit
    0 shl 12+ 1 shl 13+ 0 shl 14+ 1 shl 15  //left digit

    ;
    serial.WriteData(inttostr(i));
    sleep(25);
    serial.WriteData(inttostr(j));
    sleep(25);
    serial.WriteData(inttostr(m));
    sleep(25);



    serial.Active:=false;
    if (h= -1) then
    begin
      inputtimer.enabled:=false;

      USBconnect.Caption:=Cardnotfoundstring;
    end
    else
    begin
      inputtimer.enabled:=true;
      USBconnect.Caption:=Cardstring+' v2.'+ inttostr(h) +' '+Connectedstring;
    end;
  end;


end;


procedure TCountdownform.hide;
begin
if hideicons.checked=true then hideicons.checked:=false else hideicons.checked:=true;
end;





procedure TCountdownform.hide2;
begin
if hideicons.checked=true then
begin
  SOicon.visible:=false;
  nexticon.visible:=false;
  playpauzeicon.Visible:=false;
  stopicon.Visible:=false;

  resizeicon.Visible:=false;
  turnup.Visible:=false;
  turndown.Visible:=false;
  seriedown.Visible:=false;
  serieup.Visible:=false;

  turnlabel.Visible:=false;
  serielabel.Visible:=false;
  arrowlabel.Visible:=false;
  shooternr.Visible:=false;
  USBconnect.Visible:=false;
  USB.Visible:=false;
end
else
begin
  clockicon.Visible:=true;
  settings.Visible:=true;
  resizeicon.Visible:=true;
  closeicon.Visible:=true;

  if (archerysystem <> 'manual') and (archerysystem<>'follow') then
  begin
    nexticon.visible:=true;
    playpauzeicon.Visible:=true;
    stopicon.Visible:=true;
    turnup.Visible:=true;
    turndown.Visible:=true;
    seriedown.Visible:=true;
    serieup.Visible:=true;
    danger.Visible:=true;

    if archerysystem<>'fitafin'then turnlabel.Visible:=true;
    if archerysystem='fita' then serielabel.Visible:=true;
    if archerysystem='25m1p' then arrowlabel.Visible:=true;

    if archerysystem<>'fitafin'then shooternr.Visible:=true;

  end;
  USBconnect.Visible:=true;
  USB.Visible:=true;

end;

end;


procedure TCountdownform.dots_1Click(Sender: TObject);
begin
  if (archerysystem='fitafin') and (finarrow.Checked=true) then selectleftarcher else hide;

end;

procedure TCountdownform.digit2_1Click(Sender: TObject);
begin
  if (archerysystem='fitafin') and (finarrow.Checked=true) then selectleftarcher else hide;

end;

procedure TCountdownform.digit1_1Click(Sender: TObject);
begin
  if (archerysystem='fitafin') and (finarrow.Checked=true) then selectleftarcher else
   begin
     if hideicons.checked=true then hideicons.checked:=false else hideicons.checked:=true;
     views;
   end;



end;

procedure TCountdownform.USBconnectClick(Sender: TObject);
begin
  connect;
end;

procedure TCountdownform.inputtimerTimer(Sender: TObject);
var k: longint;

  //inputtimer is meant to read the button in the external hardware and prevent 'dendering'
  //the next button has a separate timer
begin
  inputtimer.Enabled:=false;
  inputtimer.Interval:=50;

{$IFDEF Windows}


  k:=ReadAllDigital;
  if  (k and 1)>0 then
  begin
    if archerysystem<>'manual' then playpauze
    else
    begin
      case HWbutton1.ItemIndex of
        0: setred;
        1: setorange;
        2: setgreen;
        3: onebeep;
        4: twobeeps;
        5: threebeeps;
        6: stopemergency;
      end;
    end;
    inputtimer.Interval:=350;

  end;
  if  (k and 2)>0 then
  begin
    if archerysystem<>'manual' then  stop
    else
    begin
      case HWbutton2.ItemIndex of
        0: setred;
        1: setorange;
        2: setgreen;
        3: onebeep;
        4: twobeeps;
        5: threebeeps;
        6: stopemergency;
      end;
    end;
    inputtimer.Interval:=350;
    
  end;
  if  (k and 4)>0 then
  begin
    if archerysystem='manual' then
    begin
      case HWbutton3.ItemIndex of
        0: setred;
        1: setorange;
        2: setgreen;
        3: onebeep;
        4: twobeeps;
        5: threebeeps;
        6: stopemergency;
      end;
    end;
    inputtimer.Interval:=350;

  end;
  if  (k and 8)>0 then
  begin
    if archerysystem<>'manual' then  downturn
    else
    begin
      case HWbutton4.ItemIndex of
        0: setred;
        1: setorange;
        2: setgreen;
        3: onebeep;
        4: twobeeps;
        5: threebeeps;
        6: stopemergency;
      end;
    end;
    inputtimer.Interval:=350;
  end;
  if  (k and 16)>0 then
  begin
    if archerysystem<>'manual' then upturn
    else
    begin
      case HWbutton5.ItemIndex of
        0: setred;
        1: setorange;
        2: setgreen;
        3: onebeep;
        4: twobeeps;
        5: threebeeps;
        6: stopemergency;
      end;
    end;
    inputtimer.Interval:=350;

  end;
 {$ENDIF}
 inputtimer.Enabled:=true;
end;

procedure TCountdownform.inputtimernextTimer(Sender: TObject);
var k : longint;
begin
 inputtimernext.Enabled:=false;
{$IFDEF Windows}
  k:=ReadAllDigital;

  if  (k and 4)>0 then
  begin
    if archerysystem<>'manual' then next

  end;


{$ENDIF}

  inputtimernext.Enabled:=true;
end;

procedure TCountdownform.usbClick(Sender: TObject);
begin
  connect;
end;

procedure TCountdownform.Shooter2Click(Sender: TObject);
begin
  if archerysystem<>'follow' then
  begin
    if Archersperturn=1 then turnnumber:=2 else turnnumber:=1 ;
    views;
  end;


end;

procedure TCountdownform.Shooter4Click(Sender: TObject);
begin
  if archerysystem<>'follow' then
  begin
    if Archersperturn=1 then turnnumber:=4 else turnnumber:=2 ;
    views;
  end;



end;

procedure TCountdownform.Shooter3Click(Sender: TObject);
begin
if archerysystem<>'follow' then
begin
  if Archersperturn=1 then turnnumber:=3;
  if Archersperturn=2 then turnnumber:=2;
  if Archersperturn=3 then turnnumber:=1;

  views;
end;




end;

procedure TCountdownform.Shooter1Click(Sender: TObject);
begin
if archerysystem<>'follow' then
begin
  turnnumber:=1;
  views;
end;

end;

procedure TCountdownform.greentimesoChange(Sender: TObject);
begin
totaltimeso.Caption:= inttostr( trunc(orangetimeso.value)+trunc(greentimeso.value));
startupscenario.Text:='--';
end;

procedure TCountdownform.orangetimesoChange(Sender: TObject);
begin
totaltimeso.Caption:= inttostr( trunc(orangetimeso.value)+trunc(greentimeso.value));
startupscenario.Text:='--';
end;

procedure TCountdownform.greentime1pChange(Sender: TObject);
begin
totaltime1p.Caption:= inttostr( trunc(orangetime1p.value)+trunc(greentime1p.value));
startupscenario.Text:='--';
end;

procedure TCountdownform.orangetime1pChange(Sender: TObject);
begin
totaltime1p.Caption:= inttostr( trunc(orangetime1p.value)+trunc(greentime1p.value));
startupscenario.Text:='--';
end;

procedure TCountdownform.nrof1pshootersChange(Sender: TObject);
begin
  if onepijl.checked=true then
  begin
    startupscenario.Text:='--';
    Shooters:=nrof1pshooters.Value;
    Turnsperserie:=nrof1pshooters.Value;
    if turnnumber > nrof1pshooters.Value then  turnnumber:=nrof1pshooters.Value;
    views;
  end;
end;

procedure TCountdownform.SOiconClick(Sender: TObject);
begin
  if (FirstTimer.enabled=false) then
  begin
    nrofSOarrows:=1;
    soff;
  end;

end;

procedure TCountdownform.shooteronearrownrClick(Sender: TObject);
begin
  if archerysystem<>'follow' then
  begin
    upturn;
  end;


end;

procedure TCountdownform.shooteronearrowClick(Sender: TObject);
begin
  if archerysystem<>'follow' then
  begin
    downturn;
  end;


end;

procedure TCountdownform.showseq;
begin
  if topbot.checked=true then
  begin
    fitaseq:='T-B';
    if ABCDperEND.Checked=true then fitaseq2:='T-B' else fitaseq2:='B-T';
  end;

  if oneone.checked=true then
  begin
    fitaseq:='A';
    fitaseq2:='A';
  end;
  if onetwo.checked=true then
  begin
    fitaseq:='A-B';
    if ABCDperEND.Checked=true then fitaseq2:='A-B' else fitaseq2:='B-A';
  end;
  if onethree.checked=true then
  begin
    fitaseq:='A-B-C';
    if ABCDperEND.Checked=true then fitaseq2:='A-B-C' else fitaseq2:='C-A-B';
  end;
  if onefour.checked=true then
  begin
    fitaseq:='A-B-C-D';
    if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D' else fitaseq2:='D-A-B-C';
  end;
  if onefive.checked=true then
  begin
    fitaseq:='A-B-C-D-E';
    if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E' else fitaseq2:='E-A-B-C-D';
  end;
  if onesix.checked=true then
  begin
    fitaseq:='A-B-C-D-E-F';
    if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E-F' else fitaseq2:='F-A-B-C-D-E';
  end;

  if twotwo.checked=true then
  begin
    fitaseq:='AB-CD';
    if ABCDperEND.Checked=true then fitaseq2:='AB-CD' else fitaseq2:='CD-AB';
  end;
  if twothree.checked=true then
  begin
    fitaseq:='AB-CD-EF';
    if ABCDperEND.Checked=true then fitaseq2:='AB-CD-EF' else fitaseq2:='EF-AB-CD';
  end;
  if threetwo.checked=true then
  begin
    fitaseq:='ABC-DEF';
    if ABCDperEND.Checked=true then fitaseq2:='ABC-DEF' else fitaseq2:='DEF-ABC';
  end;

  if dbltime.checked=true then doubleseq.caption:= Concat('[',fitaseq,']');
  if dblturn.checked=true then doubleseq.caption:= Concat('[',fitaseq,'-',fitaseq,']');
  resizewindow;

end;
procedure TCountdownform.showtime;

begin
  if dbltime.checked=true then duration :=Concat( inttostr((greentime.value)+(orangetime.value)+(greentime.value)+(orangetime.value)),'sec.');
  if dblturn.checked=true then duration :=Concat( inttostr((greentime.value)+(orangetime.value)),'sec.');
  if Turnsperserie=2 then duration := Concat(duration,'+',duration);
  if Turnsperserie=3 then duration := Concat(duration,'+',duration,'+',duration);
  if Turnsperserie=4 then duration := Concat(duration,'+',duration,'+',duration,'+',duration);
  if Turnsperserie=5 then duration := Concat(duration,'+',duration,'+',duration,'+',duration,'+',duration);
  if Turnsperserie=6 then duration := Concat(duration,'+',duration,'+',duration,'+',duration,'+',duration,'+',duration);

  if dbltime.checked=true then doubletime.caption:= Concat('(',duration,')');

  if dblturn.checked=true then doubletime.caption:= Concat('(',duration,'+',duration,')');


end;

procedure TCountdownform.doubleturnsClick(Sender: TObject);
begin
  if doubleturns.checked=true then
  begin
    dbltime.Visible:=true;
    dblturn.Visible:=true;
    doubleseq.Visible:=true;
    doubletime.Visible:=true;
    groupsign.Visible:=true;
    nrofturns:=2;
    if dblturn.Checked=true then
    begin
      times:=1;
      turnsss:=2
    end;
    if dbltime.Checked=true then
    begin
      times:=2;
      turnsss:=1
    end;



  end
  else
  begin
    dbltime.Visible:=false;
    dblturn.Visible:=false;
    doubleseq.Visible:=false;
    doubletime.Visible:=false;
    groupsign.Visible:=false;
    nrofturns:=1;
      times:=1;
      turnsss:=1

  end;
  showseq;
  showtime;
  startupscenario.Text:='--';
  views;

end;

procedure TCountdownform.resizeiconClick(Sender: TObject);
begin
  windowsize;
end;



procedure TCountdownform.websitenameClick(Sender: TObject);
begin
  next;
end;

procedure TCountdownform.archeryclockClick(Sender: TObject);
begin
hide;
end;

procedure TCountdownform.minsecClick(Sender: TObject);
begin
  if minsec.ItemIndex=1 then minutes.Checked:=true else seconds.Checked:=true;
  resizewindow;
end;

procedure TCountdownform.saveClick(Sender: TObject);
//save settings to settings file
begin

   AssignFile(settingsfile, Filespath+'settings') ;
   ReWrite(settingsfile) ;

   writeln(settingsfile,lang.text) ;
   if minsec.itemindex=0 then writeln(settingsfile,'Sec')else Writeln(settingsfile,'Min');
   if hideicons.checked=true then writeln(settingsfile,'Hide')else Writeln(settingsfile,'nonHide');
   if speaker.checked=true then writeln(settingsfile,'Buzzer')else Writeln(settingsfile,'nonBuzzer');
   writeln(settingsfile,startupscenario.text) ;

   if showhints.checked=true then writeln(settingsfile,'Hint')else Writeln(settingsfile,'nonHint');
   if usetraffic.checked=true then writeln(settingsfile,'TL')else Writeln(settingsfile,'nonTL');
   if TLleft.checked=true then writeln(settingsfile,'TLleft')else Writeln(settingsfile,'TLright');
   writeln(settingsfile,soundselect.text) ;
   writeln(settingsfile,tostart.value) ;
   if K8055select.Checked=true then writeln(settingsfile,'K8055')else writeln(settingsfile,'nonK8055');
   writeln(settingsfile,serialport1.Text);
   if arduinoselect1.Checked=true then writeln(settingsfile,'arduino1')else writeln(settingsfile,'nonarduino1');
   if precountalways.Checked=true then writeln(settingsfile,'PRECOUNT')else writeln(settingsfile,'noPRECOUNT');
   writeln(settingsfile, inttostr(portnumber1.value));
   if LANselect.Checked=true then writeln(settingsfile,'LAN')else writeln(settingsfile,'nonLAN');


   CloseFile(settingsfile) ;
   if startupscenario.text='--' then
   begin
     Fstore:='gen';
     storeF;
   end;
   resizewindow;


end;

procedure TCountdownform.LangChange(Sender: TObject);
begin
 buffer:=lang.Text ;
 setlanguage;
end;

procedure TCountdownform.settingsClick(Sender: TObject);
//show or hide the settings menu
begin
  manualfollowmenuremove:=false;
  if savesettings.visible=true then
  begin
    savesettings.Visible:=false;
    prepsetpanel.Visible:=false;
  end
  else
  begin
    savesettings.Visible:=true;
    if SettingsTabs.ActivePage=tabscen then  prepsetpanel.Visible:=true;
    timeseqpanel.visible:=false ;
  end;
  menuremovesec:=5;
  menudisap1.Visible:=false;
  cdmenu.Visible:=false;
  disapsec1.Visible:=false;
  menudisap2.Visible:=false;
  cdmenu2.Visible:=false;
  disapsec2.Visible:=false;
  views;
end;

procedure TCountdownform.closeimage2Click(Sender: TObject);
begin
  savesettings.Visible:=false;
  prepsetpanel.Visible:=false;
  views;
end;

procedure TCountdownform.hideiconsClick(Sender: TObject);
begin
Hide2;
views;
end;
Procedure TCountdownform.Setsettings;
//set the correct scenario settings
begin
  ABCDperEND.checked:=false;
  If (scenario='F1') or (scenario='F2') or(scenario='F3') or(scenario='F4') or(scenario='F5') or(scenario='F6') or(scenario='F7') then
  begin
    FITA.Checked:=true;
    greentime.Value:=90;
    orangetime.Value:=30;
    redtime.Value:=10;
    greentimeso.Value:=30;
    orangetimeso.Value:=10;
    redtimeso.Value:=10;
    practiseturns.Value:=2;

  end;
  If (scenario='F1') or (scenario='F2') or(scenario='F3') or(scenario='F4') or(scenario='F5') then
  begin
    doubleturns.Checked:=false;
  end;
  If (scenario='F6') or (scenario='F7') then
  begin
    twotwo.checked:=true;
    doubleturns.Checked:=true;
  end;
  If (scenario='F8') or (scenario='F9') then
  begin
    FITAFIN.Checked:=true;
    finarrow.Checked:=true;
  end;
  If (scenario='F10') or (scenario='F11') or (scenario='F12') then
  begin
    onepijl.checked:=true;
    greentime1p.Value:=30;
    orangetime1p.Value:=15;
    redtime1p.Value:=15;

  end;


  If (scenario='F1') then
  begin
    oneone.checked:=true;
    startupscenario.Text:='shiftF1';
  end;
  If (scenario='F2') then
  begin
    onetwo.checked:=true;
    startupscenario.Text:='shiftF2';
  end;
  If (scenario='F3') then
  begin
    onethree.checked:=true;
    startupscenario.Text:='shiftF3';
  end;
  If (scenario='F4') then
  begin
    onefour.checked:=true;
    startupscenario.Text:='shiftF4';
  end;
  If (scenario='F5') then
  begin
    twotwo.checked:=true;
    startupscenario.Text:='shiftF5';
  end;
  If (scenario='F6') then
  begin
    dblturn.Checked:=true;
    startupscenario.Text:='shiftF6';
  end;
  If (scenario='F7') then
  begin
    dbltime.Checked:=true;
    startupscenario.Text:='shiftF7';
  end;

  If (scenario='F8') then
  begin
    timeperturn.Checked:=true;
    startupscenario.Text:='shiftF8';
    finalturns.Value:=3;
    greenfinal.Value:=20;
    orangefinal.Value:=0;
    redfinal.Value:=10;
  end;

  If (scenario='F9') then
  begin
    timeperend.Checked:=true;
    startupscenario.Text:='shiftF9';
    finalteamturns.Value:=2;
    greenfinalend.Value:=120;
    orangefinalend.Value:=0;
    redfinalend.Value:=10;
  end;



  If (scenario='F10') then
  begin
    nrof1pshooters.value:=4;
    startupscenario.Text:='shiftF10';
  end;
  If (scenario='F11') then
  begin
    nrof1pshooters.value:=5;
    startupscenario.Text:='shiftF11';
  end;
  If (scenario='F12') then
  begin
    nrof1pshooters.value:=6;
    startupscenario.Text:='shiftF12';
  end;

  initsystemtype;

end;


procedure TCountdownform.F1ButtonClick(Sender: TObject);
begin
  scenario:='F1';
  Setsettings;
end;



procedure TCountdownform.F2ButtonClick(Sender: TObject);
begin
  scenario:='F2';
  Setsettings;
end;

procedure TCountdownform.F3ButtonClick(Sender: TObject);
begin
  scenario:='F3';
  Setsettings;
end;

procedure TCountdownform.F4ButtonClick(Sender: TObject);
begin
  scenario:='F4';
  Setsettings;
end;

procedure TCountdownform.F5ButtonClick(Sender: TObject);
begin
  scenario:='F5';
  Setsettings;
end;

procedure TCountdownform.F6ButtonClick(Sender: TObject);
begin
  scenario:='F6';
  Setsettings;
end;

procedure TCountdownform.F7ButtonClick(Sender: TObject);
begin
  scenario:='F7';
  Setsettings;
end;

procedure TCountdownform.F8ButtonClick(Sender: TObject);
begin
  scenario:='F8';
  Setsettings;
end;

procedure TCountdownform.F9ButtonClick(Sender: TObject);
begin
  scenario:='F9';
  Setsettings;
end;

procedure TCountdownform.F10ButtonClick(Sender: TObject);
begin
  scenario:='F10';
  Setsettings;
end;

procedure TCountdownform.F11ButtonClick(Sender: TObject);
begin
  scenario:='F11';
  Setsettings;
end;

procedure TCountdownform.F12ButtonClick(Sender: TObject);
begin
  scenario:='F12';
  Setsettings;
end;

procedure TCountdownform.practiseturnsChange(Sender: TObject);
begin

  if (Practiseturns.value< serienumber)   and (Practiseturn =1) then
  if (Practiseturns.value=0) then Practiseturn :=0 else
  begin
    Practiseturn:=1;
    serienumber:=Practiseturns.value;

  end;
  startupscenario.Text:='--';
  views;
end;

procedure TCountdownform.startupscenarioChange(Sender: TObject);
begin
buffer:=startupscenario.Text;
changescenario;
end;



Procedure TCountdownform.getsetting;
//read the settings from file
begin
   Reset(scenariotextfile) ;
   ReadLn(scenariotextfile, archerysystem) ;
   if archerysystem='25m1p' then
   begin
     onepijl.Checked:=true;
   end;
   if archerysystem='fita' then
   begin

     FITA.Checked:=true;
   end;
   if archerysystem='fitafin' then
   begin

     FITAFIN.Checked:=true;
   end;
   if archerysystem='manual' then
   begin
     manual.Checked:=true;
   end;

   if archerysystem='follow' then
   begin
     follow.Checked:=true;
   end;

   ReadLn(scenariotextfile, buffer) ;  //Fitafinal or fita/25m1p
   ReadLn(scenariotextfile, fitamode) ;

   if fitamode=0 then topbot.checked:=true;
   if fitamode=1 then oneone.checked:=true;
   if fitamode=2 then onetwo.checked:=true;
   if fitamode=3 then onethree.checked:=true;
   if fitamode=4 then onefour.checked:=true;
   if fitamode=5 then twotwo.checked:=true;
   if fitamode=6 then onefive.checked:=true;
   if fitamode=7 then onesix.checked:=true;
   if fitamode=8 then twothree.checked:=true;
   if fitamode=9 then threetwo.checked:=true;


   readln(scenariotextfile,nrofturns); //double turn or not?
   if nrofturns=1 then doubleturns.checked:=false else doubleturns.checked:=true;

   readln(scenariotextfile,buffer); //seconds green fita system
   greentime.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //seconds orange fita system
   orangetime.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //seconds red fita system
   redtime.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //seconds greeen for Fita shootoff
   greentimeso.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //seconds orange for Fita shootoff
   orangetimeso.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //seconds red for Fita shootoff
   redtimeso.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //seconds green for  25m1p system
   greentime1p.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //seconds orange for 25m1p system
   orangetime1p.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //seconds red for 25m1p system
   redtime1p.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); // nr of practise arrows Fita
   practiseturns.Value:=StrToInt(buffer);
   if (practiseturns.Value=0) and (archerysystem='fita') then Practiseturn :=0;
   readln(scenariotextfile,buffer); //nr of archers per target 25m1p
   if archerysystem='25m1p' then nrof1pshooters.Value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); // single or double turns (long distances?)
   if buffer = 'TRUE' then doubleturns.checked:=true else doubleturns.Checked:=false;
   readln(scenariotextfile,buffer); // single or double time
   if buffer = 'TRUE' then dbltime.checked:=true else dbltime.checked:= false;
   readln(scenariotextfile,buffer); // single or double turns
   if buffer = 'TRUE' then dblturn.checked:=true else dblturn.Checked:=false;

   readln(scenariotextfile,buffer); //

   if buffer<>'' then showtarget.checked:=StrToBool(buffer); //
   readln(scenariotextfile,buffer); //
   if buffer<>'' then finarrow.checked:=StrToBool(buffer); //
   readln(scenariotextfile,buffer); //
   //if buffer<>'' then finname.checked:=StrToBool(buffer); //
   readln(scenariotextfile,buffer); //
   if buffer<>'' then timeperturn.checked:=StrToBool(buffer); //
   readln(scenariotextfile,buffer); //
   if buffer<>'' then timeperend.checked:=StrToBool(buffer); //
   readln(scenariotextfile,buffer); //
   if buffer<>'' then leftnumber.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then rightnumber.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then finalturns.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then finalteamturns.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then greenfinal.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then orangefinal.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then redfinal.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then greenfinalend.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then orangefinalend.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then redfinalend.value:=StrToInt(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then BCDtoROG2.checked:=StrToBool(buffer); //
   readln(scenariotextfile,buffer); //
   if buffer<>'' then abcd25m1p.checked:=StrToBool(buffer); //
   readln(scenariotextfile,buffer); //
   ABCDperEND.checked:=false;
   if buffer<>'' then ABCDperEND.checked:=StrToBool(buffer); //

   readln(scenariotextfile,buffer); //
   if buffer<>'' then nrredbuzz.Value:=StrToint(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then nrorangebuzz.Value:=StrToint(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then nrgreenbuzz.Value:=StrToint(buffer);

   readln(scenariotextfile,buffer); //
   if buffer<>'' then HWbutton1.ItemIndex:=StrToint(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then HWbutton2.ItemIndex:=StrToint(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then HWbutton3.ItemIndex:=StrToint(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then HWbutton4.ItemIndex:=StrToint(buffer);
   readln(scenariotextfile,buffer); //
   if buffer<>'' then HWbutton5.ItemIndex:=StrToint(buffer);
   readln(scenariotextfile,buffer); //
   readln(scenariotextfile,buffer); //
   if buffer='right' then rightscreen.Checked:=true else leftscreen.Checked:=true;
   readln(scenariotextfile,buffer); //
   if buffer='followLAN' then LANinput.Checked:=true else serialinput.Checked:=true;
   readln(scenariotextfile,buffer); // nr of practise arrows 25m1p
   nrof1ppractisearrows.Value:=StrToInt(buffer);
   if (nrof1ppractisearrows.Value=0) and (archerysystem='25m1p') then Practiseturn :=0;
   readln(scenariotextfile,buffer); //
   if buffer<>'' then viewleft.checked:=StrToBool(buffer); //
   readln(scenariotextfile,buffer); //
   if buffer<>'' then viewright.checked:=StrToBool(buffer); //
   readln(scenariotextfile,buffer); //
   if buffer<>'' then rotate25m1p.checked:=StrToBool(buffer); //
   readln(scenariotextfile,buffer); //
   if buffer<>'' then fromHOST.Text:=buffer;

   CloseFile(scenariotextfile) ;
   if archerysystem='25m1p' then
   begin
      nrofturns:=1;
      times:=1;
      turnsss:=1;
   end;


end;
procedure TCountdownform.getscenario;
begin
  if FileExistsUTF8(Filespath+'scenarios/'+scenario)=true then
  begin
    AssignFile(scenariotextfile, Filespath+'scenarios/'+scenario) ;
    getsetting;
  end;
end;



procedure TCountdownform.showF8;    //showF1 to show F12 are almost identical and needs to be combined to one procedure (not done yet for priority reasons)
Begin
  if archerysystem='fita' then
  begin
    var2F8sequence.Visible:=true;
    varF8SOtimelabel.Visible:=true;
    varF8SOtime.Visible:=true;
    varF8SOredtime.Visible:=true;
    varF8waitlabel2.Visible:=true;
    varF8shoottime.caption:=Concat(inttostr(greentime.value),'+', inttostr(orangetime.value),'=',inttostr((greentime.value)+(orangetime.value)),' sec,');
    varF8SOtime.caption:=Concat(inttostr(greentimeso.value),'+', inttostr(orangetimeso.value),'=',inttostr((greentimeso.value)+(orangetimeso.value)),' sec,');
    varF8shootredtime.caption:=Concat(inttostr(redtime.value),' sec');
    varF8SOredtime.caption:=Concat(inttostr(redtimeso.value),' sec');
    fitaseq:='';

    if topbot.checked=true then
    begin
      fitaseq:='T-B';
      if ABCDperEND.Checked=true then fitaseq2:='T-B' else fitaseq2:='B-T';
    end;


    if oneone.checked=true then
    begin
      fitaseq:='A';
      fitaseq2:='A';
    end;
    if onetwo.checked=true then
    begin
      fitaseq:='A-B';
      if ABCDperEND.Checked=true then fitaseq2:='A-B' else fitaseq2:='B-A';
    end;
    if onethree.checked=true then
    begin
      fitaseq:='A-B-C';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C' else fitaseq2:='C-A-B';
    end;
    if onefour.checked=true then
    begin
      fitaseq:='A-B-C-D';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D' else fitaseq2:='D-A-B-C';
    end;
    if twotwo.checked=true then
    begin
      fitaseq:='AB-CD';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD' else fitaseq2:='CD-AB';
    end;

    if onefive.checked=true then
    begin
      fitaseq:='A-B-C-D-E';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E' else fitaseq2:='E-A-B-C-D';
    end;
    if onesix.checked=true then
    begin
      fitaseq:='A-B-C-D-E-F';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E-F' else fitaseq2:='F-A-B-C-D-E';
    end;

    if twothree.checked=true then
    begin
      fitaseq:='AB-CD-EF';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD-EF' else fitaseq2:='EF-AB-CD';
    end;

    if threetwo.checked=true then
    begin
      fitaseq:='ABC-DEF';
      if ABCDperEND.Checked=true then fitaseq2:='ABC-DEF' else fitaseq2:='DEF-ABC';
    end;


    if nrofturns=1 then
    begin
      varF8sequence.Caption:=Concat('1: [',fitaseq,']');
      var2F8sequence.Caption:=Concat('2: [',fitaseq2,']');
    end;
    if (nrofturns=2) and (turnsss=2) then
    begin
      varF8sequence.Caption:=Concat('1: [',fitaseq,'-',fitaseq,']');
      var2F8sequence.Caption:=Concat('2: [',fitaseq2,'-',fitaseq2,']');
    end;
    if (nrofturns=2) and (times=2) then
    begin
      varF8sequence.Caption:=Concat('1: [2x ',fitaseq,']');
      var2F8sequence.Caption:=Concat('1: [2x ',fitaseq2,']');
      varF8shoottime.caption:=Concat(inttostr((greentime.value)+(greentime.value)+(orangetime.value)),'+', inttostr(orangetime.value),'=',inttostr(2*((greentime.value)+(orangetime.value))),' sec,');
    end;

  end;
  if archerysystem='manual' then
  begin
    var2F8sequence.Visible:=false;
    varF8SOtimelabel.Visible:=false;
    varF8SOtime.Visible:=false;
    varF8SOredtime.Visible:=false;
    varF8waitlabel2.Visible:=false;
    varF8shoottime.caption:='manual';
    varF8shootredtime.caption:='';
    varF8sequence.Caption:='';
  end;
  if archerysystem='follow' then
  begin
    var2F8sequence.Visible:=false;
    varF8SOtimelabel.Visible:=false;
    varF8SOtime.Visible:=false;
    varF8SOredtime.Visible:=false;
    varF8waitlabel2.Visible:=false;
    varF8shoottime.caption:='follow';
    varF8shootredtime.caption:='';
    varF8sequence.Caption:='';
  end;


  if archerysystem='25m1p' then
  begin
    var2F8sequence.Visible:=false;
    varF8SOtimelabel.Visible:=true;
    varF8SOtime.Visible:=true;
    varF8SOredtime.Visible:=true;
    varF8waitlabel2.Visible:=true;
    varF8shoottime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF8SOtime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF8shootredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF8SOredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF8sequence.Caption:=Concat('1--',inttostr(nrof1pshooters.value));
  end;
  if archerysystem='fitafin' then
  begin
    var2F8sequence.Visible:=false;
    varF8SOtimelabel.Visible:=false;
    varF8SOtime.Visible:=false;
    varF8SOredtime.Visible:=false;
    varF8waitlabel2.Visible:=false;
    if timeperturn.checked=true then
    begin
      varF8shoottime.caption:=Concat(inttostr(greenfinal.value),'+', inttostr(orangefinal.value),'=',inttostr((greenfinal.value)+(orangefinal.value)),' sec,');
      varF8sequence.caption:=Concat(inttostr(finalturns.Value),'X Finalround ind.');
      varF8shootredtime.caption:=Concat(inttostr(redfinal.value),' sec');
    end
    else
    begin
      varF8shoottime.caption:=Concat(inttostr(greenfinalend.value),'+', inttostr(orangefinalend.value),'=',inttostr((greenfinalend.value)+(orangefinalend.value)),' sec,');
      varF8sequence.caption:=Concat(inttostr(finalteamturns.Value),'X Finalround team');
      varF8shootredtime.caption:=Concat(inttostr(redfinalend.value),' sec');
    end;
  end;

end;


procedure TCountdownform.showF1;    //showF1 to show F12 are almost identical and needs to be combined to one procedure (not done yet for priority reasons)
Begin
  if archerysystem='fita' then
  begin
    var2F1sequence.Visible:=true;
    varF1SOtimelabel.Visible:=true;
    varF1SOtime.Visible:=true;
    varF1SOredtime.Visible:=true;
    varF1waitlabel2.Visible:=true;
    varF1shoottime.caption:=Concat(inttostr(greentime.value),'+', inttostr(orangetime.value),'=',inttostr((greentime.value)+(orangetime.value)),' sec,');
    varF1SOtime.caption:=Concat(inttostr(greentimeso.value),'+', inttostr(orangetimeso.value),'=',inttostr((greentimeso.value)+(orangetimeso.value)),' sec,');
    varF1shootredtime.caption:=Concat(inttostr(redtime.value),' sec');
    varF1SOredtime.caption:=Concat(inttostr(redtimeso.value),' sec');
    fitaseq:='';

    if topbot.checked=true then
    begin
      fitaseq:='T-B';
      if ABCDperEND.Checked=true then fitaseq2:='T-B' else fitaseq2:='B-T';
    end;

    if oneone.checked=true then
    begin
      fitaseq:='A';
      fitaseq2:='A';
    end;
    if onetwo.checked=true then
    begin
      fitaseq:='A-B';
      if ABCDperEND.Checked=true then fitaseq2:='A-B' else fitaseq2:='B-A';
    end;
    if onethree.checked=true then
    begin
      fitaseq:='A-B-C';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C' else fitaseq2:='C-A-B';
    end;
    if onefour.checked=true then
    begin
      fitaseq:='A-B-C-D';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D' else fitaseq2:='D-A-B-C';
    end;
    if twotwo.checked=true then
    begin
      fitaseq:='AB-CD';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD' else fitaseq2:='CD-AB';
    end;

    if onefive.checked=true then
    begin
      fitaseq:='A-B-C-D-E';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E' else fitaseq2:='E-A-B-C-D';
    end;
    if onesix.checked=true then
    begin
      fitaseq:='A-B-C-D-E-F';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E-F' else fitaseq2:='F-A-B-C-D-E';
    end;

    if twothree.checked=true then
    begin
      fitaseq:='AB-CD-EF';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD-EF' else fitaseq2:='EF-AB-CD';
    end;

    if threetwo.checked=true then
    begin
      fitaseq:='ABC-DEF';
      if ABCDperEND.Checked=true then fitaseq2:='ABC-DEF' else fitaseq2:='DEF-ABC';
    end;


    if nrofturns=1 then
    begin
      varF1sequence.Caption:=Concat('1: [',fitaseq,']');
      var2F1sequence.Caption:=Concat('2: [',fitaseq2,']');
    end;
    if (nrofturns=2) and (turnsss=2) then
    begin
      varF1sequence.Caption:=Concat('1: [',fitaseq,'-',fitaseq,']');
      var2F1sequence.Caption:=Concat('2: [',fitaseq2,'-',fitaseq2,']');
    end;
    if (nrofturns=2) and (times=2) then
    begin
      varF1sequence.Caption:=Concat('1: [2x ',fitaseq,']');
      var2F1sequence.Caption:=Concat('1: [2x ',fitaseq2,']');
      varF1shoottime.caption:=Concat(inttostr((greentime.value)+(greentime.value)+(orangetime.value)),'+', inttostr(orangetime.value),'=',inttostr(2*((greentime.value)+(orangetime.value))),' sec,');
    end;

  end;
  if archerysystem='manual' then
  begin
    var2F1sequence.Visible:=false;
    varF1SOtimelabel.Visible:=false;
    varF1SOtime.Visible:=false;
    varF1SOredtime.Visible:=false;
    varF1waitlabel2.Visible:=false;
    varF1shoottime.caption:='manual';
    varF1shootredtime.caption:='';
    varF1sequence.Caption:='';
  end;
  if archerysystem='follow' then
  begin
    var2F1sequence.Visible:=false;
    varF1SOtimelabel.Visible:=false;
    varF1SOtime.Visible:=false;
    varF1SOredtime.Visible:=false;
    varF1waitlabel2.Visible:=false;
    varF1shoottime.caption:='follow';
    varF1shootredtime.caption:='';
    varF1sequence.Caption:='';
  end;


  if archerysystem='25m1p' then
  begin
    var2F1sequence.Visible:=false;
    varF1SOtimelabel.Visible:=true;
    varF1SOtime.Visible:=true;
    varF1SOredtime.Visible:=true;
    varF1waitlabel2.Visible:=true;
    varF1shoottime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF1SOtime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF1shootredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF1SOredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF1sequence.Caption:=Concat('1--',inttostr(nrof1pshooters.value));
  end;
  if archerysystem='fitafin' then
  begin
    var2F1sequence.Visible:=false;
    varF1SOtimelabel.Visible:=false;
    varF1SOtime.Visible:=false;
    varF1SOredtime.Visible:=false;
    varF1waitlabel2.Visible:=false;
    if timeperturn.checked=true then
    begin
      varF1shoottime.caption:=Concat(inttostr(greenfinal.value),'+', inttostr(orangefinal.value),'=',inttostr((greenfinal.value)+(orangefinal.value)),' sec,');
      varF1sequence.caption:=Concat(inttostr(finalturns.Value),'X Finalround ind.');
      varF1shootredtime.caption:=Concat(inttostr(redfinal.value),' sec');
    end
    else
    begin
      varF1shoottime.caption:=Concat(inttostr(greenfinalend.value),'+', inttostr(orangefinalend.value),'=',inttostr((greenfinalend.value)+(orangefinalend.value)),' sec,');
      varF1sequence.caption:=Concat(inttostr(finalteamturns.Value),'X Finalround team');
      varF1shootredtime.caption:=Concat(inttostr(redfinalend.value),' sec');
    end;
  end;

end;

procedure TCountdownform.showF2;    //showF1 to show F12 are almost identical and needs to be combined to one procedure (not done yet for priority reasons)
Begin
  if archerysystem='fita' then
  begin
    var2F2sequence.Visible:=true;
    varF2SOtimelabel.Visible:=true;
    varF2SOtime.Visible:=true;
    varF2SOredtime.Visible:=true;
    varF2waitlabel2.Visible:=true;
    varF2shoottime.caption:=Concat(inttostr(greentime.value),'+', inttostr(orangetime.value),'=',inttostr((greentime.value)+(orangetime.value)),' sec,');
    varF2SOtime.caption:=Concat(inttostr(greentimeso.value),'+', inttostr(orangetimeso.value),'=',inttostr((greentimeso.value)+(orangetimeso.value)),' sec,');
    varF2shootredtime.caption:=Concat(inttostr(redtime.value),' sec');
    varF2SOredtime.caption:=Concat(inttostr(redtimeso.value),' sec');
    fitaseq:='';

    if topbot.checked=true then
    begin
      fitaseq:='T-B';
      if ABCDperEND.Checked=true then fitaseq2:='T-B' else fitaseq2:='B-T';
    end;


    if oneone.checked=true then
    begin
      fitaseq:='A';
      fitaseq2:='A';
    end;
    if onetwo.checked=true then
    begin
      fitaseq:='A-B';
      if ABCDperEND.Checked=true then fitaseq2:='A-B' else fitaseq2:='B-A';
    end;
    if onethree.checked=true then
    begin
      fitaseq:='A-B-C';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C' else fitaseq2:='C-A-B';
    end;
    if onefour.checked=true then
    begin
      fitaseq:='A-B-C-D';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D' else fitaseq2:='D-A-B-C';
    end;
    if twotwo.checked=true then
    begin
      fitaseq:='AB-CD';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD' else fitaseq2:='CD-AB';
    end;
    if onefive.checked=true then
    begin
      fitaseq:='A-B-C-D-E';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E' else fitaseq2:='E-A-B-C-D';
    end;
    if onesix.checked=true then
    begin
      fitaseq:='A-B-C-D-E-F';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E-F' else fitaseq2:='F-A-B-C-D-E';
    end;

    if twothree.checked=true then
    begin
      fitaseq:='AB-CD-EF';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD-EF' else fitaseq2:='EF-AB-CD';
    end;

    if threetwo.checked=true then
    begin
      fitaseq:='ABC-DEF';
      if ABCDperEND.Checked=true then fitaseq2:='ABC-DEF' else fitaseq2:='DEF-ABC';
    end;


    if nrofturns=1 then
    begin
      varF2sequence.Caption:=Concat('1: [',fitaseq,']');
      var2F2sequence.Caption:=Concat('2: [',fitaseq2,']');
    end;
    if (nrofturns=2) and (turnsss=2) then
    begin
      varF2sequence.Caption:=Concat('1: [',fitaseq,'-',fitaseq,']');
      var2F2sequence.Caption:=Concat('2: [',fitaseq2,'-',fitaseq2,']');
    end;
    if (nrofturns=2) and (times=2) then
    begin
      varF2sequence.Caption:=Concat('1: [2x ',fitaseq,']');
      var2F2sequence.Caption:=Concat('1: [2x ',fitaseq2,']');
      varF2shoottime.caption:=Concat(inttostr((greentime.value)+(greentime.value)+(orangetime.value)),'+', inttostr(orangetime.value),'=',inttostr(2*((greentime.value)+(orangetime.value))),' sec,');
    end;

  end;
  if archerysystem='manual' then
  begin
    var2F2sequence.Visible:=false;
    varF2SOtimelabel.Visible:=false;
    varF2SOtime.Visible:=false;
    varF2SOredtime.Visible:=false;
    varF2waitlabel2.Visible:=false;
    varF2shoottime.caption:='manual';
    varF2shootredtime.caption:='';
    varF2sequence.Caption:='';

  end;

  if archerysystem='follow' then
  begin
    var2F2sequence.Visible:=false;
    varF2SOtimelabel.Visible:=false;
    varF2SOtime.Visible:=false;
    varF2SOredtime.Visible:=false;
    varF2waitlabel2.Visible:=false;
    varF2shoottime.caption:='follow';
    varF2shootredtime.caption:='';
    varF2sequence.Caption:='';

  end;

  if archerysystem='25m1p' then
  begin
    var2F2sequence.Visible:=false;
    varF2SOtimelabel.Visible:=true;
    varF2SOtime.Visible:=true;
    varF2SOredtime.Visible:=true;
    varF2waitlabel2.Visible:=true;
    varF2shoottime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF2SOtime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF2shootredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF2SOredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF2sequence.Caption:=Concat('1--',inttostr(nrof1pshooters.value));
  end;
  if archerysystem='fitafin' then
  begin
    var2F2sequence.Visible:=false;
    varF2SOtimelabel.Visible:=false;
    varF2SOtime.Visible:=false;
    varF2SOredtime.Visible:=false;
    varF2waitlabel2.Visible:=false;
    if timeperturn.checked=true then
    begin
      varF2shoottime.caption:=Concat(inttostr(greenfinal.value),'+', inttostr(orangefinal.value),'=',inttostr((greenfinal.value)+(orangefinal.value)),' sec,');
      varF2sequence.caption:=Concat(inttostr(finalturns.Value),'X Finalround ind.');
      varF2shootredtime.caption:=Concat(inttostr(redfinal.value),' sec');
    end
    else
    begin
      varF2shoottime.caption:=Concat(inttostr(greenfinalend.value),'+', inttostr(orangefinalend.value),'=',inttostr((greenfinalend.value)+(orangefinalend.value)),' sec,');
      varF2sequence.caption:=Concat(inttostr(finalteamturns.Value),'X Finalround team');
      varF2shootredtime.caption:=Concat(inttostr(redfinalend.value),' sec');
    end;
  end;

end;


procedure TCountdownform.showF3;      //showF1 to show F12 are almost identical and needs to be combined to one procedure (not done yet for priority reasons)
Begin
  if archerysystem='fita' then
  begin
    var2F3sequence.Visible:=true;
    varF3SOtimelabel.Visible:=true;
    varF3SOtime.Visible:=true;
    varF3SOredtime.Visible:=true;
    varF3waitlabel2.Visible:=true;
    varF3shoottime.caption:=Concat(inttostr(greentime.value),'+', inttostr(orangetime.value),'=',inttostr((greentime.value)+(orangetime.value)),' sec,');
    varF3SOtime.caption:=Concat(inttostr(greentimeso.value),'+', inttostr(orangetimeso.value),'=',inttostr((greentimeso.value)+(orangetimeso.value)),' sec,');
    varF3shootredtime.caption:=Concat(inttostr(redtime.value),' sec');
    varF3SOredtime.caption:=Concat(inttostr(redtimeso.value),' sec');
    fitaseq:='';

    if topbot.checked=true then
    begin
      fitaseq:='T-B';
      if ABCDperEND.Checked=true then fitaseq2:='T-B' else fitaseq2:='B-T';
    end;


    if oneone.checked=true then
    begin
      fitaseq:='A';
      fitaseq2:='A';
    end;
    if onetwo.checked=true then
    begin
      fitaseq:='A-B';
      if ABCDperEND.Checked=true then fitaseq2:='A-B' else fitaseq2:='B-A';
    end;
    if onethree.checked=true then
    begin
      fitaseq:='A-B-C';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C' else fitaseq2:='C-A-B';
    end;
    if onefour.checked=true then
    begin
      fitaseq:='A-B-C-D';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D' else fitaseq2:='D-A-B-C';
    end;
    if twotwo.checked=true then
    begin
      fitaseq:='AB-CD';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD' else fitaseq2:='CD-AB';
    end;
    if onefive.checked=true then
    begin
      fitaseq:='A-B-C-D-E';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E' else fitaseq2:='E-A-B-C-D';
    end;
    if onesix.checked=true then
    begin
      fitaseq:='A-B-C-D-E-F';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E-F' else fitaseq2:='F-A-B-C-D-E';
    end;

    if twothree.checked=true then
    begin
      fitaseq:='AB-CD-EF';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD-EF' else fitaseq2:='EF-AB-CD';
    end;

    if threetwo.checked=true then
    begin
      fitaseq:='ABC-DEF';
      if ABCDperEND.Checked=true then fitaseq2:='ABC-DEF' else fitaseq2:='DEF-ABC';
    end;


    if nrofturns=1 then
    begin
      varF3sequence.Caption:=Concat('1: [',fitaseq,']');
      var2F3sequence.Caption:=Concat('2: [',fitaseq2,']');
    end;
    if (nrofturns=2) and (turnsss=2) then
    begin
      varF3sequence.Caption:=Concat('1: [',fitaseq,'-',fitaseq,']');
      var2F3sequence.Caption:=Concat('2: [',fitaseq2,'-',fitaseq2,']');
    end;
    if (nrofturns=2) and (times=2) then
    begin
      varF3sequence.Caption:=Concat('1: [2x ',fitaseq,']');
      var2F3sequence.Caption:=Concat('1: [2x ',fitaseq2,']');
      varF3shoottime.caption:=Concat(inttostr((greentime.value)+(greentime.value)+(orangetime.value)),'+', inttostr(orangetime.value),'=',inttostr(2*((greentime.value)+(orangetime.value))),' sec,');
    end;


  end;
  if archerysystem='manual' then
  begin
    var2F3sequence.Visible:=false;
    varF3SOtimelabel.Visible:=false;
    varF3SOtime.Visible:=false;
    varF3SOredtime.Visible:=false;
    varF3waitlabel2.Visible:=false;
    varF3shoottime.caption:='manual';
    varF3shootredtime.caption:='';
    varF3sequence.Caption:='';
  end;
  if archerysystem='follow' then
  begin
    var2F3sequence.Visible:=false;
    varF3SOtimelabel.Visible:=false;
    varF3SOtime.Visible:=false;
    varF3SOredtime.Visible:=false;
    varF3waitlabel2.Visible:=false;
    varF3shoottime.caption:='follow';
    varF3shootredtime.caption:='';
    varF3sequence.Caption:='';
  end;


  if archerysystem='25m1p' then
  begin
    var2F3sequence.Visible:=false;
    varF3SOtimelabel.Visible:=true;
    varF3SOtime.Visible:=true;
    varF3SOredtime.Visible:=true;
    varF3waitlabel2.Visible:=true;
    varF3shoottime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF3SOtime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF3shootredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF3SOredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF3sequence.Caption:=Concat('1--',inttostr(nrof1pshooters.value));
  end;
  if archerysystem='fitafin' then
  begin
    var2F3sequence.Visible:=false;
    varF3SOtimelabel.Visible:=false;
    varF3SOtime.Visible:=false;
    varF3SOredtime.Visible:=false;
    varF3waitlabel2.Visible:=false;
    if timeperturn.checked=true then
    begin
      varF3shoottime.caption:=Concat(inttostr(greenfinal.value),'+', inttostr(orangefinal.value),'=',inttostr((greenfinal.value)+(orangefinal.value)),' sec,');
      varF3sequence.caption:=Concat(inttostr(finalturns.Value),'X Finalround ind.');
      varF3shootredtime.caption:=Concat(inttostr(redfinal.value),' sec');
    end
    else
    begin
      varF3shoottime.caption:=Concat(inttostr(greenfinalend.value),'+', inttostr(orangefinalend.value),'=',inttostr((greenfinalend.value)+(orangefinalend.value)),' sec,');
      varF3sequence.caption:=Concat(inttostr(finalteamturns.Value),'X Finalround team');
      varF3shootredtime.caption:=Concat(inttostr(redfinalend.value),' sec');
    end;
  end;

end;


procedure TCountdownform.showF4;        //showF1 to show F12 are almost identical and needs to be combined to one procedure (not done yet for priority reasons)
Begin
  if archerysystem='fita' then
  begin
    var2F4sequence.Visible:=true;
    varF4SOtimelabel.Visible:=true;
    varF4SOtime.Visible:=true;
    varF4SOredtime.Visible:=true;
    varF4waitlabel2.Visible:=true;
    varF4shoottime.caption:=Concat(inttostr(greentime.value),'+', inttostr(orangetime.value),'=',inttostr((greentime.value)+(orangetime.value)),' sec,');
    varF4SOtime.caption:=Concat(inttostr(greentimeso.value),'+', inttostr(orangetimeso.value),'=',inttostr((greentimeso.value)+(orangetimeso.value)),' sec,');
    varF4shootredtime.caption:=Concat(inttostr(redtime.value),' sec');
    varF4SOredtime.caption:=Concat(inttostr(redtimeso.value),' sec');
    fitaseq:='';

    if topbot.checked=true then
    begin
      fitaseq:='T-B';
      if ABCDperEND.Checked=true then fitaseq2:='T-B' else fitaseq2:='B-T';
    end;


    if oneone.checked=true then
    begin
      fitaseq:='A';
      fitaseq2:='A';
    end;
    if onetwo.checked=true then
    begin
      fitaseq:='A-B';
      if ABCDperEND.Checked=true then fitaseq2:='A-B' else fitaseq2:='B-A';
    end;
    if onethree.checked=true then
    begin
      fitaseq:='A-B-C';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C' else fitaseq2:='C-A-B';
    end;
    if onefour.checked=true then
    begin
      fitaseq:='A-B-C-D';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D' else fitaseq2:='D-A-B-C';
    end;
    if twotwo.checked=true then
    begin
      fitaseq:='AB-CD';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD' else fitaseq2:='CD-AB';
    end;

    if onefive.checked=true then
    begin
      fitaseq:='A-B-C-D-E';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E' else fitaseq2:='E-A-B-C-D';
    end;
    if onesix.checked=true then
    begin
      fitaseq:='A-B-C-D-E-F';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E-F' else fitaseq2:='F-A-B-C-D-E';
    end;

    if twothree.checked=true then
    begin
      fitaseq:='AB-CD-EF';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD-EF' else fitaseq2:='EF-AB-CD';
    end;

    if threetwo.checked=true then
    begin
      fitaseq:='ABC-DEF';
      if ABCDperEND.Checked=true then fitaseq2:='ABC-DEF' else fitaseq2:='DEF-ABC';
    end;


    if nrofturns=1 then
    begin
      varF4sequence.Caption:=Concat('1: [',fitaseq,']');
      var2F4sequence.Caption:=Concat('2: [',fitaseq2,']');
    end;
    if (nrofturns=2) and (turnsss=2) then
    begin
      varF4sequence.Caption:=Concat('1: [',fitaseq,'-',fitaseq,']');
      var2F4sequence.Caption:=Concat('2: [',fitaseq2,'-',fitaseq2,']');
    end;
    if (nrofturns=2) and (times=2) then
    begin
      varF4sequence.Caption:=Concat('1: [2x ',fitaseq,']');
      var2F4sequence.Caption:=Concat('1: [2x ',fitaseq2,']');
      varF4shoottime.caption:=Concat(inttostr((greentime.value)+(greentime.value)+(orangetime.value)),'+', inttostr(orangetime.value),'=',inttostr(2*((greentime.value)+(orangetime.value))),' sec,');
    end;

  end;
  if archerysystem='manual' then
  begin
    var2F4sequence.Visible:=false;
    varF4SOtimelabel.Visible:=false;
    varF4SOtime.Visible:=false;
    varF4SOredtime.Visible:=false;
    varF4waitlabel2.Visible:=false;
    varF4shoottime.caption:='manual';
    varF4shootredtime.caption:='';
    varF4sequence.Caption:='';
  end;
  if archerysystem='follow' then
  begin
    var2F4sequence.Visible:=false;
    varF4SOtimelabel.Visible:=false;
    varF4SOtime.Visible:=false;
    varF4SOredtime.Visible:=false;
    varF4waitlabel2.Visible:=false;
    varF4shoottime.caption:='follow';
    varF4shootredtime.caption:='';
    varF4sequence.Caption:='';
  end;


  if archerysystem='25m1p' then
  begin
    var2F4sequence.Visible:=false;
    varF4SOtimelabel.Visible:=true;
    varF4SOtime.Visible:=true;
    varF4SOredtime.Visible:=true;
    varF4waitlabel2.Visible:=true;
    varF4shoottime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF4SOtime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF4shootredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF4SOredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF4sequence.Caption:=Concat('1--',inttostr(nrof1pshooters.value));
  end;
  if archerysystem='fitafin' then
  begin
    var2F4sequence.Visible:=false;
    varF4SOtimelabel.Visible:=false;
    varF4SOtime.Visible:=false;
    varF4SOredtime.Visible:=false;
    varF4waitlabel2.Visible:=false;
    if timeperturn.checked=true then
    begin
      varF4shoottime.caption:=Concat(inttostr(greenfinal.value),'+', inttostr(orangefinal.value),'=',inttostr((greenfinal.value)+(orangefinal.value)),' sec,');
      varF4sequence.caption:=Concat(inttostr(finalturns.Value),'X Finalround ind.');
      varF4shootredtime.caption:=Concat(inttostr(redfinal.value),' sec');
    end
    else
    begin
      varF4shoottime.caption:=Concat(inttostr(greenfinalend.value),'+', inttostr(orangefinalend.value),'=',inttostr((greenfinalend.value)+(orangefinalend.value)),' sec,');
      varF4sequence.caption:=Concat(inttostr(finalteamturns.Value),'X Finalround team');
      varF4shootredtime.caption:=Concat(inttostr(redfinalend.value),' sec');
    end;
  end;

end;


procedure TCountdownform.showF5;       //showF1 to show F12 are almost identical and needs to be combined to one procedure (not done yet for priority reasons)
Begin
  if archerysystem='fita' then
  begin
    var2F5sequence.Visible:=true;
    varF5SOtimelabel.Visible:=true;
    varF5SOtime.Visible:=true;
    varF5SOredtime.Visible:=true;
    varF5waitlabel2.Visible:=true;
    varF5shoottime.caption:=Concat(inttostr(greentime.value),'+', inttostr(orangetime.value),'=',inttostr((greentime.value)+(orangetime.value)),' sec,');
    varF5SOtime.caption:=Concat(inttostr(greentimeso.value),'+', inttostr(orangetimeso.value),'=',inttostr((greentimeso.value)+(orangetimeso.value)),' sec,');
    varF5shootredtime.caption:=Concat(inttostr(redtime.value),' sec');
    varF5SOredtime.caption:=Concat(inttostr(redtimeso.value),' sec');
    fitaseq:='';

    if topbot.checked=true then
    begin
      fitaseq:='T-B';
      if ABCDperEND.Checked=true then fitaseq2:='T-B' else fitaseq2:='B-T';
    end;


    if oneone.checked=true then
    begin
      fitaseq:='A';
      fitaseq2:='A';
    end;
    if onetwo.checked=true then
    begin
      fitaseq:='A-B';
      if ABCDperEND.Checked=true then fitaseq2:='A-B' else fitaseq2:='B-A';
    end;
    if onethree.checked=true then
    begin
      fitaseq:='A-B-C';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C' else fitaseq2:='C-A-B';
    end;
    if onefour.checked=true then
    begin
      fitaseq:='A-B-C-D';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D' else fitaseq2:='D-A-B-C';
    end;
    if twotwo.checked=true then
    begin
      fitaseq:='AB-CD';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD' else fitaseq2:='CD-AB';
    end;
    if onefive.checked=true then
    begin
      fitaseq:='A-B-C-D-E';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E' else fitaseq2:='E-A-B-C-D';
    end;
    if onesix.checked=true then
    begin
      fitaseq:='A-B-C-D-E-F';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E-F' else fitaseq2:='F-A-B-C-D-E';
    end;

    if twothree.checked=true then
    begin
      fitaseq:='AB-CD-EF';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD-EF' else fitaseq2:='EF-AB-CD';
    end;

    if threetwo.checked=true then
    begin
      fitaseq:='ABC-DEF';
      if ABCDperEND.Checked=true then fitaseq2:='ABC-DEF' else fitaseq2:='DEF-ABC';
    end;


    if nrofturns=1 then
    begin
      varF5sequence.Caption:=Concat('1: [',fitaseq,']');
      var2F5sequence.Caption:=Concat('2: [',fitaseq2,']');
    end;
    if (nrofturns=2) and (turnsss=2) then
    begin
      varF5sequence.Caption:=Concat('1: [',fitaseq,'-',fitaseq,']');
      var2F5sequence.Caption:=Concat('2: [',fitaseq2,'-',fitaseq2,']');
    end;
    if (nrofturns=2) and (times=2) then
    begin
      varF5sequence.Caption:=Concat('1: [2x ',fitaseq,']');
      var2F5sequence.Caption:=Concat('1: [2x ',fitaseq2,']');
      varF5shoottime.caption:=Concat(inttostr((greentime.value)+(greentime.value)+(orangetime.value)),'+', inttostr(orangetime.value),'=',inttostr(2*((greentime.value)+(orangetime.value))),' sec,');
    end;

  end;
  if archerysystem='manual' then
  begin
    var2F5sequence.Visible:=false;
    varF5SOtimelabel.Visible:=false;
    varF5SOtime.Visible:=false;
    varF5SOredtime.Visible:=false;
    varF5waitlabel2.Visible:=false;
    varF5shoottime.caption:='manual';
    varF5shootredtime.caption:='';
    varF5sequence.Caption:='';
  end;
  if archerysystem='follow' then
  begin
    var2F5sequence.Visible:=false;
    varF5SOtimelabel.Visible:=false;
    varF5SOtime.Visible:=false;
    varF5SOredtime.Visible:=false;
    varF5waitlabel2.Visible:=false;
    varF5shoottime.caption:='follow';
    varF5shootredtime.caption:='';
    varF5sequence.Caption:='';
  end;


  if archerysystem='25m1p' then
  begin
    var2F5sequence.Visible:=false;
    varF5SOtimelabel.Visible:=true;
    varF5SOtime.Visible:=true;
    varF5SOredtime.Visible:=true;
    varF5waitlabel2.Visible:=true;
    varF5shoottime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF5SOtime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF5shootredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF5SOredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF5sequence.Caption:=Concat('1--',inttostr(nrof1pshooters.value));
  end;
  if archerysystem='fitafin' then
  begin
    var2F5sequence.Visible:=false;
    varF5SOtimelabel.Visible:=false;
    varF5SOtime.Visible:=false;
    varF5SOredtime.Visible:=false;
    varF5waitlabel2.Visible:=false;
    if timeperturn.checked=true then
    begin
      varF5shoottime.caption:=Concat(inttostr(greenfinal.value),'+', inttostr(orangefinal.value),'=',inttostr((greenfinal.value)+(orangefinal.value)),' sec,');
      varF5sequence.caption:=Concat(inttostr(finalturns.Value),'X Finalround ind.');
      varF5shootredtime.caption:=Concat(inttostr(redfinal.value),' sec');
    end
    else
    begin
      varF5shoottime.caption:=Concat(inttostr(greenfinalend.value),'+', inttostr(orangefinalend.value),'=',inttostr((greenfinalend.value)+(orangefinalend.value)),' sec,');
      varF5sequence.caption:=Concat(inttostr(finalteamturns.Value),'X Finalround team');
      varF5shootredtime.caption:=Concat(inttostr(redfinalend.value),' sec');
    end;
  end;

end;

procedure TCountdownform.showF6;        //showF1 to show F12 are almost identical and needs to be combined to one procedure (not done yet for priority reasons)
Begin
  if archerysystem='fita' then
  begin
    var2F6sequence.Visible:=true;
    varF6SOtimelabel.Visible:=true;
    varF6SOtime.Visible:=true;
    varF6SOredtime.Visible:=true;
    varF6waitlabel2.Visible:=true;
    varF6shoottime.caption:=Concat(inttostr(greentime.value),'+', inttostr(orangetime.value),'=',inttostr((greentime.value)+(orangetime.value)),' sec,');
    varF6SOtime.caption:=Concat(inttostr(greentimeso.value),'+', inttostr(orangetimeso.value),'=',inttostr((greentimeso.value)+(orangetimeso.value)),' sec,');
    varF6shootredtime.caption:=Concat(inttostr(redtime.value),' sec');
    varF6SOredtime.caption:=Concat(inttostr(redtimeso.value),' sec');
    fitaseq:='';

    if topbot.checked=true then
    begin
      fitaseq:='T-B';
      if ABCDperEND.Checked=true then fitaseq2:='T-B' else fitaseq2:='B-T';
    end;


    if oneone.checked=true then
    begin
      fitaseq:='A';
      fitaseq2:='A';
    end;
    if onetwo.checked=true then
    begin
      fitaseq:='A-B';
      if ABCDperEND.Checked=true then fitaseq2:='A-B' else fitaseq2:='B-A';
    end;
    if onethree.checked=true then
    begin
      fitaseq:='A-B-C';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C' else fitaseq2:='C-A-B';
    end;
    if onefour.checked=true then
    begin
      fitaseq:='A-B-C-D';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D' else fitaseq2:='D-A-B-C';
    end;
    if twotwo.checked=true then
    begin
      fitaseq:='AB-CD';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD' else fitaseq2:='CD-AB';
    end;
    if onefive.checked=true then
    begin
      fitaseq:='A-B-C-D-E';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E' else fitaseq2:='E-A-B-C-D';
    end;
    if onesix.checked=true then
    begin
      fitaseq:='A-B-C-D-E-F';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E-F' else fitaseq2:='F-A-B-C-D-E';
    end;

    if twothree.checked=true then
    begin
      fitaseq:='AB-CD-EF';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD-EF' else fitaseq2:='EF-AB-CD';
    end;

    if threetwo.checked=true then
    begin
      fitaseq:='ABC-DEF';
      if ABCDperEND.Checked=true then fitaseq2:='ABC-DEF' else fitaseq2:='DEF-ABC';
    end;



    if nrofturns=1 then
    begin
      varF6sequence.Caption:=Concat('1: [',fitaseq,']');
      var2F6sequence.Caption:=Concat('2: [',fitaseq2,']');
    end;
    if (nrofturns=2) and (turnsss=2) then
    begin
      varF6sequence.Caption:=Concat('1: [',fitaseq,'-',fitaseq,']');
      var2F6sequence.Caption:=Concat('2: [',fitaseq2,'-',fitaseq2,']');
    end;
    if (nrofturns=2) and (times=2) then
    begin
      varF6sequence.Caption:=Concat('1: [2x ',fitaseq,']');
      var2F6sequence.Caption:=Concat('1: [2x ',fitaseq2,']');
      varF6shoottime.caption:=Concat(inttostr((greentime.value)+(greentime.value)+(orangetime.value)),'+', inttostr(orangetime.value),'=',inttostr(2*((greentime.value)+(orangetime.value))),' sec,');
    end;

  end;
  if archerysystem='manual' then
  begin
    var2F6sequence.Visible:=false;
    varF6SOtimelabel.Visible:=false;
    varF6SOtime.Visible:=false;
    varF6SOredtime.Visible:=false;
    varF6waitlabel2.Visible:=false;
    varF6shoottime.caption:='manual';
    varF6shootredtime.caption:='';
    varF6sequence.Caption:='';
  end;
  if archerysystem='follow' then
  begin
    var2F6sequence.Visible:=false;
    varF6SOtimelabel.Visible:=false;
    varF6SOtime.Visible:=false;
    varF6SOredtime.Visible:=false;
    varF6waitlabel2.Visible:=false;
    varF6shoottime.caption:='follow';
    varF6shootredtime.caption:='';
    varF6sequence.Caption:='';
  end;


  if archerysystem='25m1p' then
  begin
    var2F6sequence.Visible:=false;
    varF6SOtimelabel.Visible:=true;
    varF6SOtime.Visible:=true;
    varF6SOredtime.Visible:=true;
    varF6waitlabel2.Visible:=true;
    varF6shoottime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF6SOtime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF6shootredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF6SOredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF6sequence.Caption:=Concat('1--',inttostr(nrof1pshooters.value));
  end;
  if archerysystem='fitafin' then
  begin
    var2F6sequence.Visible:=false;
    varF6SOtimelabel.Visible:=false;
    varF6SOtime.Visible:=false;
    varF6SOredtime.Visible:=false;
    varF6waitlabel2.Visible:=false;
    if timeperturn.checked=true then
    begin
      varF6shoottime.caption:=Concat(inttostr(greenfinal.value),'+', inttostr(orangefinal.value),'=',inttostr((greenfinal.value)+(orangefinal.value)),' sec,');
      varF6sequence.caption:=Concat(inttostr(finalturns.Value),'X Finalround ind.');
      varF6shootredtime.caption:=Concat(inttostr(redfinal.value),' sec');
    end
    else
    begin
      varF6shoottime.caption:=Concat(inttostr(greenfinalend.value),'+', inttostr(orangefinalend.value),'=',inttostr((greenfinalend.value)+(orangefinalend.value)),' sec,');
      varF6sequence.caption:=Concat(inttostr(finalteamturns.Value),'X Finalround team');
      varF6shootredtime.caption:=Concat(inttostr(redfinalend.value),' sec');
    end;
  end;

end;

procedure TCountdownform.showF7;         //showF1 to show F12 are almost identical and needs to be combined to one procedure (not done yet for priority reasons)
Begin
  if archerysystem='fita' then
  begin
    var2F7sequence.Visible:=true;
    varF7SOtimelabel.Visible:=true;
    varF7SOtime.Visible:=true;
    varF7SOredtime.Visible:=true;
    varF7waitlabel2.Visible:=true;
    varF7shoottime.caption:=Concat(inttostr(greentime.value),'+', inttostr(orangetime.value),'=',inttostr((greentime.value)+(orangetime.value)),' sec,');
    varF7SOtime.caption:=Concat(inttostr(greentimeso.value),'+', inttostr(orangetimeso.value),'=',inttostr((greentimeso.value)+(orangetimeso.value)),' sec,');
    varF7shootredtime.caption:=Concat(inttostr(redtime.value),' sec');
    varF7SOredtime.caption:=Concat(inttostr(redtimeso.value),' sec');
    fitaseq:='';

    if topbot.checked=true then
    begin
      fitaseq:='T-B';
      if ABCDperEND.Checked=true then fitaseq2:='T-B' else fitaseq2:='B-T';
    end;


    if oneone.checked=true then
    begin
      fitaseq:='A';
      fitaseq2:='A';
    end;
    if onetwo.checked=true then
    begin
      fitaseq:='A-B';
      if ABCDperEND.Checked=true then fitaseq2:='A-B' else fitaseq2:='B-A';
    end;
    if onethree.checked=true then
    begin
      fitaseq:='A-B-C';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C' else fitaseq2:='C-A-B';
    end;
    if onefour.checked=true then
    begin
      fitaseq:='A-B-C-D';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D' else fitaseq2:='D-A-B-C';
    end;
    if twotwo.checked=true then
    begin
      fitaseq:='AB-CD';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD' else fitaseq2:='CD-AB';
    end;
    if onefive.checked=true then
    begin
      fitaseq:='A-B-C-D-E';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E' else fitaseq2:='E-A-B-C-D';
    end;
    if onesix.checked=true then
    begin
      fitaseq:='A-B-C-D-E-F';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E-F' else fitaseq2:='F-A-B-C-D-E';
    end;

    if twothree.checked=true then
    begin
      fitaseq:='AB-CD-EF';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD-EF' else fitaseq2:='EF-AB-CD';
    end;

    if threetwo.checked=true then
    begin
      fitaseq:='ABC-DEF';
      if ABCDperEND.Checked=true then fitaseq2:='ABC-DEF' else fitaseq2:='DEF-ABC';
    end;


    if nrofturns=1 then
    begin
      varF7sequence.Caption:=Concat('1: [',fitaseq,']');
      var2F7sequence.Caption:=Concat('2: [',fitaseq2,']');
    end;
    if (nrofturns=2) and (turnsss=2) then
    begin
      varF7sequence.Caption:=Concat('1: [',fitaseq,'-',fitaseq,']');
      var2F7sequence.Caption:=Concat('2: [',fitaseq2,'-',fitaseq2,']');
    end;
    if (nrofturns=2) and (times=2) then
    begin
      varF7sequence.Caption:=Concat('1: [2x ',fitaseq,']');
      var2F7sequence.Caption:=Concat('2: [2x ',fitaseq2,']');
      varF7shoottime.caption:=Concat(inttostr((greentime.value)+(greentime.value)+(orangetime.value)),'+', inttostr(orangetime.value),'=',inttostr(2*((greentime.value)+(orangetime.value))),' sec,');
    end;

  end;
  if archerysystem='manual' then
  begin
    var2F7sequence.Visible:=false;
    varF7SOtimelabel.Visible:=false;
    varF7SOtime.Visible:=false;
    varF7SOredtime.Visible:=false;
    varF7waitlabel2.Visible:=false;
    varF7shoottime.caption:='manual';
    varF7shootredtime.caption:='';
    varF7sequence.Caption:='';
  end;
  if archerysystem='follow' then
  begin
    var2F7sequence.Visible:=false;
    varF7SOtimelabel.Visible:=false;
    varF7SOtime.Visible:=false;
    varF7SOredtime.Visible:=false;
    varF7waitlabel2.Visible:=false;
    varF7shoottime.caption:='follow';
    varF7shootredtime.caption:='';
    varF7sequence.Caption:='';
  end;


  if archerysystem='25m1p' then
  begin
    var2F7sequence.Visible:=false;
    varF7SOtimelabel.Visible:=true;
    varF7SOtime.Visible:=true;
    varF7SOredtime.Visible:=true;
    varF7waitlabel2.Visible:=true;
    varF7shoottime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF7SOtime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF7shootredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF7SOredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF7sequence.Caption:=Concat('1--',inttostr(nrof1pshooters.value));
  end;
  if archerysystem='fitafin' then
  begin
    var2F7sequence.Visible:=false;
    varF7SOtimelabel.Visible:=false;
    varF7SOtime.Visible:=false;
    varF7SOredtime.Visible:=false;
    varF7waitlabel2.Visible:=false;
    if timeperturn.checked=true then
    begin
      varF7shoottime.caption:=Concat(inttostr(greenfinal.value),'+', inttostr(orangefinal.value),'=',inttostr((greenfinal.value)+(orangefinal.value)),' sec,');
      varF7sequence.caption:=Concat(inttostr(finalturns.Value),'X Finalround ind.');
      varF7shootredtime.caption:=Concat(inttostr(redfinal.value),' sec');
    end
    else
    begin
      varF7shoottime.caption:=Concat(inttostr(greenfinalend.value),'+', inttostr(orangefinalend.value),'=',inttostr((greenfinalend.value)+(orangefinalend.value)),' sec,');
      varF7sequence.caption:=Concat(inttostr(finalteamturns.Value),'X Finalround team');
      varF7shootredtime.caption:=Concat(inttostr(redfinalend.value),' sec');
    end;
  end;

end;

procedure TCountdownform.showF9;             //showF1 to show F12 are almost identical and needs to be combined to one procedure (not done yet for priority reasons)
Begin
  if archerysystem='fita' then
  begin
    var2F9sequence.Visible:=true;
    varF9SOtimelabel.Visible:=true;
    varF9SOtime.Visible:=true;
    varF9SOredtime.Visible:=true;
    varF9waitlabel2.Visible:=true;
    varF9shoottime.caption:=Concat(inttostr(greentime.value),'+', inttostr(orangetime.value),'=',inttostr((greentime.value)+(orangetime.value)),' sec,');
    varF9SOtime.caption:=Concat(inttostr(greentimeso.value),'+', inttostr(orangetimeso.value),'=',inttostr((greentimeso.value)+(orangetimeso.value)),' sec,');
    varF9shootredtime.caption:=Concat(inttostr(redtime.value),' sec');
    varF9SOredtime.caption:=Concat(inttostr(redtimeso.value),' sec');
    fitaseq:='';

    if topbot.checked=true then
    begin
      fitaseq:='T-B';
      if ABCDperEND.Checked=true then fitaseq2:='T-B' else fitaseq2:='B-T';
    end;


    if oneone.checked=true then
    begin
      fitaseq:='A';
      fitaseq2:='A';
    end;
    if onetwo.checked=true then
    begin
      fitaseq:='A-B';
      if ABCDperEND.Checked=true then fitaseq2:='A-B' else fitaseq2:='B-A';
    end;
    if onethree.checked=true then
    begin
      fitaseq:='A-B-C';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C' else fitaseq2:='C-A-B';
    end;
    if onefour.checked=true then
    begin
      fitaseq:='A-B-C-D';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D' else fitaseq2:='D-A-B-C';
    end;
    if twotwo.checked=true then
    begin
      fitaseq:='AB-CD';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD' else fitaseq2:='CD-AB';
    end;
    if onefive.checked=true then
    begin
      fitaseq:='A-B-C-D-E';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E' else fitaseq2:='E-A-B-C-D';
    end;
    if onesix.checked=true then
    begin
      fitaseq:='A-B-C-D-E-F';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E-F' else fitaseq2:='F-A-B-C-D-E';
    end;

    if twothree.checked=true then
    begin
      fitaseq:='AB-CD-EF';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD-EF' else fitaseq2:='EF-AB-CD';
    end;

    if threetwo.checked=true then
    begin
      fitaseq:='ABC-DEF';
      if ABCDperEND.Checked=true then fitaseq2:='ABC-DEF' else fitaseq2:='DEF-ABC';
    end;


    if nrofturns=1 then
    begin
      varF9sequence.Caption:=Concat('1: [',fitaseq,']');
      var2F9sequence.Caption:=Concat('2: [',fitaseq2,']');
    end;
    if (nrofturns=2) and (turnsss=2) then
    begin
      varF9sequence.Caption:=Concat('1: [',fitaseq,'-',fitaseq,']');
      var2F9sequence.Caption:=Concat('2: [',fitaseq2,'-',fitaseq2,']');
    end;
    if (nrofturns=2) and (times=2) then
    begin
      varF9sequence.Caption:=Concat('1: [2x ',fitaseq,']');
      var2F9sequence.Caption:=Concat('1: [2x ',fitaseq2,']');
      varF9shoottime.caption:=Concat(inttostr((greentime.value)+(greentime.value)+(orangetime.value)),'+', inttostr(orangetime.value),'=',inttostr(2*((greentime.value)+(orangetime.value))),' sec,');
    end;


  end;
  if archerysystem='manual' then
  begin
    var2F9sequence.Visible:=false;
    varF9SOtimelabel.Visible:=false;
    varF9SOtime.Visible:=false;
    varF9SOredtime.Visible:=false;
    varF9waitlabel2.Visible:=false;
    varF9shoottime.caption:='manual';
    varF9shootredtime.caption:='';
    varF9sequence.Caption:='';
  end;
  if archerysystem='follow' then
  begin
    var2F9sequence.Visible:=false;
    varF9SOtimelabel.Visible:=false;
    varF9SOtime.Visible:=false;
    varF9SOredtime.Visible:=false;
    varF9waitlabel2.Visible:=false;
    varF9shoottime.caption:='follow';
    varF9shootredtime.caption:='';
    varF9sequence.Caption:='';
  end;


  if archerysystem='25m1p' then
  begin
    var2F9sequence.Visible:=false;
    varF9SOtimelabel.Visible:=true;
    varF9SOtime.Visible:=true;
    varF9SOredtime.Visible:=true;
    varF9waitlabel2.Visible:=true;
    varF9shoottime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF9SOtime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF9shootredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF9SOredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF9sequence.Caption:=Concat('1--',inttostr(nrof1pshooters.value));
  end;
  if archerysystem='fitafin' then
  begin
    var2F9sequence.Visible:=false;
    varF9SOtimelabel.Visible:=false;
    varF9SOtime.Visible:=false;
    varF9SOredtime.Visible:=false;
    varF9waitlabel2.Visible:=false;
    if timeperturn.checked=true then
    begin
      varF9shoottime.caption:=Concat(inttostr(greenfinal.value),'+', inttostr(orangefinal.value),'=',inttostr((greenfinal.value)+(orangefinal.value)),' sec,');
      varF9sequence.caption:=Concat(inttostr(finalturns.Value),'X Finalround ind.');
      varF9shootredtime.caption:=Concat(inttostr(redfinal.value),' sec');
    end
    else
    begin
      varF9shoottime.caption:=Concat(inttostr(greenfinalend.value),'+', inttostr(orangefinalend.value),'=',inttostr((greenfinalend.value)+(orangefinalend.value)),' sec,');
      varF9sequence.caption:=Concat(inttostr(finalteamturns.Value),'X Finalround team');
      varF9shootredtime.caption:=Concat(inttostr(redfinalend.value),' sec');
    end;
  end;

end;

procedure TCountdownform.showF10;             //showF1 to show F12 are almost identical and needs to be combined to one procedure (not done yet for priority reasons)
Begin
  if archerysystem='fita' then
  begin
    var2F10sequence.Visible:=true;
    varF10SOtimelabel.Visible:=true;
    varF10SOtime.Visible:=true;
    varF10SOredtime.Visible:=true;
    varF10waitlabel2.Visible:=true;
    varF10shoottime.caption:=Concat(inttostr(greentime.value),'+', inttostr(orangetime.value),'=',inttostr((greentime.value)+(orangetime.value)),' sec,');
    varF10SOtime.caption:=Concat(inttostr(greentimeso.value),'+', inttostr(orangetimeso.value),'=',inttostr((greentimeso.value)+(orangetimeso.value)),' sec,');
    varF10shootredtime.caption:=Concat(inttostr(redtime.value),' sec');
    varF10SOredtime.caption:=Concat(inttostr(redtimeso.value),' sec');
    fitaseq:='';

    if topbot.checked=true then
    begin
      fitaseq:='T-B';
      if ABCDperEND.Checked=true then fitaseq2:='T-B' else fitaseq2:='B-T';
    end;


    if oneone.checked=true then
    begin
      fitaseq:='A';
      fitaseq2:='A';
    end;
    if onetwo.checked=true then
    begin
      fitaseq:='A-B';
      if ABCDperEND.Checked=true then fitaseq2:='A-B' else fitaseq2:='B-A';
    end;
    if onethree.checked=true then
    begin
      fitaseq:='A-B-C';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C' else fitaseq2:='C-A-B';
    end;
    if onefour.checked=true then
    begin
      fitaseq:='A-B-C-D';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D' else fitaseq2:='D-A-B-C';
    end;
    if twotwo.checked=true then
    begin
      fitaseq:='AB-CD';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD' else fitaseq2:='CD-AB';
    end;
    if onefive.checked=true then
    begin
      fitaseq:='A-B-C-D-E';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E' else fitaseq2:='E-A-B-C-D';
    end;
    if onesix.checked=true then
    begin
      fitaseq:='A-B-C-D-E-F';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E-F' else fitaseq2:='F-A-B-C-D-E';
    end;

    if twothree.checked=true then
    begin
      fitaseq:='AB-CD-EF';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD-EF' else fitaseq2:='EF-AB-CD';
    end;

    if threetwo.checked=true then
    begin
      fitaseq:='ABC-DEF';
      if ABCDperEND.Checked=true then fitaseq2:='ABC-DEF' else fitaseq2:='DEF-ABC';
    end;


    if nrofturns=1 then
    begin
      varF10sequence.Caption:=Concat('1: [',fitaseq,']');
      var2F10sequence.Caption:=Concat('2: [',fitaseq2,']');
    end;
    if (nrofturns=2) and (turnsss=2) then
    begin
      varF10sequence.Caption:=Concat('1: [',fitaseq,'-',fitaseq,']');
      var2F10sequence.Caption:=Concat('2: [',fitaseq2,'-',fitaseq2,']');
    end;
    if (nrofturns=2) and (times=2) then
    begin
      varF10sequence.Caption:=Concat('1: [2x ',fitaseq,']');
      var2F10sequence.Caption:=Concat('1: [2x ',fitaseq2,']');
      varF10shoottime.caption:=Concat(inttostr((greentime.value)+(greentime.value)+(orangetime.value)),'+', inttostr(orangetime.value),'=',inttostr(2*((greentime.value)+(orangetime.value))),' sec,');
    end;

  end;
  if archerysystem='manual' then
  begin
    var2F10sequence.Visible:=false;
    varF10SOtimelabel.Visible:=false;
    varF10SOtime.Visible:=false;
    varF10SOredtime.Visible:=false;
    varF10waitlabel2.Visible:=false;
    varF10shoottime.caption:='manual';
    varF10shootredtime.caption:='';
    varF10sequence.Caption:='';
  end;
  if archerysystem='follow' then
  begin
    var2F10sequence.Visible:=false;
    varF10SOtimelabel.Visible:=false;
    varF10SOtime.Visible:=false;
    varF10SOredtime.Visible:=false;
    varF10waitlabel2.Visible:=false;
    varF10shoottime.caption:='follow';
    varF10shootredtime.caption:='';
    varF10sequence.Caption:='';
  end;


  if archerysystem='25m1p' then
  begin
    var2F10sequence.Visible:=false;
    varF10SOtimelabel.Visible:=true;
    varF10SOtime.Visible:=true;
    varF10SOredtime.Visible:=true;
    varF10waitlabel2.Visible:=true;
    varF10shoottime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF10SOtime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF10shootredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF10SOredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF10sequence.Caption:=Concat('1--',inttostr(nrof1pshooters.value));
  end;
  if archerysystem='fitafin' then
  begin
    var2F10sequence.Visible:=false;
    varF10SOtimelabel.Visible:=false;
    varF10SOtime.Visible:=false;
    varF10SOredtime.Visible:=false;
    varF10waitlabel2.Visible:=false;
    if timeperturn.checked=true then
    begin
      varF10shoottime.caption:=Concat(inttostr(greenfinal.value),'+', inttostr(orangefinal.value),'=',inttostr((greenfinal.value)+(orangefinal.value)),' sec,');
      varF10sequence.caption:=Concat(inttostr(finalturns.Value),'X Finalround ind.');
      varF10shootredtime.caption:=Concat(inttostr(redfinal.value),' sec');
    end
    else
    begin
      varF10shoottime.caption:=Concat(inttostr(greenfinalend.value),'+', inttostr(orangefinalend.value),'=',inttostr((greenfinalend.value)+(orangefinalend.value)),' sec,');
      varF10sequence.caption:=Concat(inttostr(finalteamturns.Value),'X Finalround team');
      varF10shootredtime.caption:=Concat(inttostr(redfinalend.value),' sec');
    end;
  end;

end;

procedure TCountdownform.showF11;   //showF1 to show F12 are almost identical and needs to be combined to one procedure (not done yet for priority reasons)
Begin
  if archerysystem='fita' then
  begin
    var2F11sequence.Visible:=true;
    varF11SOtimelabel.Visible:=true;
    varF11SOtime.Visible:=true;
    varF11SOredtime.Visible:=true;
    varF11waitlabel2.Visible:=true;
    varF11shoottime.caption:=Concat(inttostr(greentime.value),'+', inttostr(orangetime.value),'=',inttostr((greentime.value)+(orangetime.value)),' sec,');
    varF11SOtime.caption:=Concat(inttostr(greentimeso.value),'+', inttostr(orangetimeso.value),'=',inttostr((greentimeso.value)+(orangetimeso.value)),' sec,');
    varF11shootredtime.caption:=Concat(inttostr(redtime.value),' sec');
    varF11SOredtime.caption:=Concat(inttostr(redtimeso.value),' sec');
    fitaseq:='';

    if topbot.checked=true then
    begin
      fitaseq:='T-B';
      if ABCDperEND.Checked=true then fitaseq2:='T-B' else fitaseq2:='B-T';
    end;


    if oneone.checked=true then
    begin
      fitaseq:='A';
      fitaseq2:='A';
    end;
    if onetwo.checked=true then
    begin
      fitaseq:='A-B';
      if ABCDperEND.Checked=true then fitaseq2:='A-B' else fitaseq2:='B-A';
    end;
    if onethree.checked=true then
    begin
      fitaseq:='A-B-C';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C' else fitaseq2:='C-A-B';
    end;
    if onefour.checked=true then
    begin
      fitaseq:='A-B-C-D';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D' else fitaseq2:='D-A-B-C';
    end;
    if twotwo.checked=true then
    begin
      fitaseq:='AB-CD';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD' else fitaseq2:='CD-AB';
    end;
    if onefive.checked=true then
    begin
      fitaseq:='A-B-C-D-E';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E' else fitaseq2:='E-A-B-C-D';
    end;
    if onesix.checked=true then
    begin
      fitaseq:='A-B-C-D-E-F';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E-F' else fitaseq2:='F-A-B-C-D-E';
    end;

    if twothree.checked=true then
    begin
      fitaseq:='AB-CD-EF';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD-EF' else fitaseq2:='EF-AB-CD';
    end;

    if threetwo.checked=true then
    begin
      fitaseq:='ABC-DEF';
      if ABCDperEND.Checked=true then fitaseq2:='ABC-DEF' else fitaseq2:='DEF-ABC';
    end;


    if nrofturns=1 then
    begin
      varF11sequence.Caption:=Concat('1: [',fitaseq,']');
      var2F11sequence.Caption:=Concat('2: [',fitaseq2,']');
    end;
    if (nrofturns=2) and (turnsss=2) then
    begin
      varF11sequence.Caption:=Concat('1: [',fitaseq,'-',fitaseq,']');
      var2F11sequence.Caption:=Concat('2: [',fitaseq2,'-',fitaseq2,']');
    end;
    if (nrofturns=2) and (times=2) then
    begin
      varF11sequence.Caption:=Concat('1: [2x ',fitaseq,']');
      var2F11sequence.Caption:=Concat('1: [2x ',fitaseq2,']');
      varF11shoottime.caption:=Concat(inttostr((greentime.value)+(greentime.value)+(orangetime.value)),'+', inttostr(orangetime.value),'=',inttostr(2*((greentime.value)+(orangetime.value))),' sec,');
    end;

  end;
  if archerysystem='manual' then
  begin
    var2F11sequence.Visible:=false;
    varF11SOtimelabel.Visible:=false;
    varF11SOtime.Visible:=false;
    varF11SOredtime.Visible:=false;
    varF11waitlabel2.Visible:=false;
    varF11shoottime.caption:='manual';
    varF11shootredtime.caption:='';
    varF11sequence.Caption:='';
  end;
  if archerysystem='follow' then
  begin
    var2F11sequence.Visible:=false;
    varF11SOtimelabel.Visible:=false;
    varF11SOtime.Visible:=false;
    varF11SOredtime.Visible:=false;
    varF11waitlabel2.Visible:=false;
    varF11shoottime.caption:='follow';
    varF11shootredtime.caption:='';
    varF11sequence.Caption:='';
  end;


  if archerysystem='25m1p' then
  begin
    var2F11sequence.Visible:=false;
    varF11SOtimelabel.Visible:=true;
    varF11SOtime.Visible:=true;
    varF11SOredtime.Visible:=true;
    varF11waitlabel2.Visible:=true;
    varF11shoottime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF11SOtime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF11shootredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF11SOredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF11sequence.Caption:=Concat('1--',inttostr(nrof1pshooters.value));
  end;
  if archerysystem='fitafin' then
  begin
    var2F11sequence.Visible:=false;
    varF11SOtimelabel.Visible:=false;
    varF11SOtime.Visible:=false;
    varF11SOredtime.Visible:=false;
    varF11waitlabel2.Visible:=false;
    if timeperturn.checked=true then
    begin
      varF11shoottime.caption:=Concat(inttostr(greenfinal.value),'+', inttostr(orangefinal.value),'=',inttostr((greenfinal.value)+(orangefinal.value)),' sec,');
      varF11sequence.caption:=Concat(inttostr(finalturns.Value),'X Finalround ind.');
      varF11shootredtime.caption:=Concat(inttostr(redfinal.value),' sec');
    end
    else
    begin
      varF11shoottime.caption:=Concat(inttostr(greenfinalend.value),'+', inttostr(orangefinalend.value),'=',inttostr((greenfinalend.value)+(orangefinalend.value)),' sec,');
      varF11sequence.caption:=Concat(inttostr(finalteamturns.Value),'X Finalround team');
      varF11shootredtime.caption:=Concat(inttostr(redfinalend.value),' sec');
    end;
  end;

end;


procedure TCountdownform.showF12;            //showF1 to show F12 are almost identical and needs to be combined to one procedure (not done yet for priority reasons)
Begin
  if archerysystem='fita' then
  begin
    var2F12sequence.Visible:=true;
    varF12SOtimelabel.Visible:=true;
    varF12SOtime.Visible:=true;
    varF12SOredtime.Visible:=true;
    varF12waitlabel2.Visible:=true;
    varF12shoottime.caption:=Concat(inttostr(greentime.value),'+', inttostr(orangetime.value),'=',inttostr((greentime.value)+(orangetime.value)),' sec,');
    varF12SOtime.caption:=Concat(inttostr(greentimeso.value),'+', inttostr(orangetimeso.value),'=',inttostr((greentimeso.value)+(orangetimeso.value)),' sec,');
    varF12shootredtime.caption:=Concat(inttostr(redtime.value),' sec');
    varF12SOredtime.caption:=Concat(inttostr(redtimeso.value),' sec');
    fitaseq:='';

    if topbot.checked=true then
    begin
      fitaseq:='T-B';
      if ABCDperEND.Checked=true then fitaseq2:='T-B' else fitaseq2:='B-T';
    end;


    if oneone.checked=true then
    begin
      fitaseq:='A';
      fitaseq2:='A';
    end;
    if onetwo.checked=true then
    begin
      fitaseq:='A-B';
      if ABCDperEND.Checked=true then fitaseq2:='A-B' else fitaseq2:='B-A';
    end;
    if onethree.checked=true then
    begin
      fitaseq:='A-B-C';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C' else fitaseq2:='C-A-B';
    end;
    if onefour.checked=true then
    begin
      fitaseq:='A-B-C-D';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D' else fitaseq2:='D-A-B-C';
    end;
    if twotwo.checked=true then
    begin
      fitaseq:='AB-CD';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD' else fitaseq2:='CD-AB';
    end;

    if onefive.checked=true then
    begin
      fitaseq:='A-B-C-D-E';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E' else fitaseq2:='E-A-B-C-D';
    end;
    if onesix.checked=true then
    begin
      fitaseq:='A-B-C-D-E-F';
      if ABCDperEND.Checked=true then fitaseq2:='A-B-C-D-E-F' else fitaseq2:='F-A-B-C-D-E';
    end;

    if twothree.checked=true then
    begin
      fitaseq:='AB-CD-EF';
      if ABCDperEND.Checked=true then fitaseq2:='AB-CD-EF' else fitaseq2:='EF-AB-CD';
    end;

    if threetwo.checked=true then
    begin
      fitaseq:='ABC-DEF';
      if ABCDperEND.Checked=true then fitaseq2:='ABC-DEF' else fitaseq2:='DEF-ABC';
    end;


    if nrofturns=1 then
    begin
      varF12sequence.Caption:=Concat('1: [',fitaseq,']');
      var2F12sequence.Caption:=Concat('2: [',fitaseq2,']');
    end;
    if (nrofturns=2) and (turnsss=2) then
    begin
      varF12sequence.Caption:=Concat('1: [',fitaseq,'-',fitaseq,']');
      var2F12sequence.Caption:=Concat('2: [',fitaseq2,'-',fitaseq2,']');
    end;
    if (nrofturns=2) and (times=2) then
    begin
      varF12sequence.Caption:=Concat('1: [2x ',fitaseq,']');
      var2F12sequence.Caption:=Concat('1: [2x ',fitaseq2,']');
      varF12shoottime.caption:=Concat(inttostr((greentime.value)+(greentime.value)+(orangetime.value)),'+', inttostr(orangetime.value),'=',inttostr(2*((greentime.value)+(orangetime.value))),' sec,');
    end;

  end;
  if archerysystem='manual' then
  begin
    var2F12sequence.Visible:=false;
    varF12SOtimelabel.Visible:=false;
    varF12SOtime.Visible:=false;
    varF12SOredtime.Visible:=false;
    varF12waitlabel2.Visible:=false;
    varF12shoottime.caption:='manual';
    varF12shootredtime.caption:='';
    varF12sequence.Caption:='';
  end;
  if archerysystem='follow' then
  begin
    var2F12sequence.Visible:=false;
    varF12SOtimelabel.Visible:=false;
    varF12SOtime.Visible:=false;
    varF12SOredtime.Visible:=false;
    varF12waitlabel2.Visible:=false;
    varF12shoottime.caption:='follow';
    varF12shootredtime.caption:='';
    varF12sequence.Caption:='';
  end;


  if archerysystem='25m1p' then
  begin
    var2F12sequence.Visible:=false;
    varF12SOtimelabel.Visible:=true;
    varF12SOtime.Visible:=true;
    varF12SOredtime.Visible:=true;
    varF12waitlabel2.Visible:=true;
    varF12shoottime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF12SOtime.caption:=Concat(inttostr(greentime1p.value),'+', inttostr(orangetime1p.value),'=',inttostr((greentime1p.value)+(orangetime1p.value)),' sec,');
    varF12shootredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF12SOredtime.caption:=Concat(inttostr(redtime1p.value),' sec');
    varF12sequence.Caption:=Concat('1--',inttostr(nrof1pshooters.value));
  end;
  if archerysystem='fitafin' then
  begin
    var2F12sequence.Visible:=false;
    varF12SOtimelabel.Visible:=false;
    varF12SOtime.Visible:=false;
    varF12SOredtime.Visible:=false;
    varF12waitlabel2.Visible:=false;
    if timeperturn.checked=true then
    begin
      varF12shoottime.caption:=Concat(inttostr(greenfinal.value),'+', inttostr(orangefinal.value),'=',inttostr((greenfinal.value)+(orangefinal.value)),' sec,');
      varF12sequence.caption:=Concat(inttostr(finalturns.Value),'X Finalround ind.');
      varF12shootredtime.caption:=Concat(inttostr(redfinal.value),' sec');
    end
    else
    begin
      varF12shoottime.caption:=Concat(inttostr(greenfinalend.value),'+', inttostr(orangefinalend.value),'=',inttostr((greenfinalend.value)+(orangefinalend.value)),' sec,');
      varF12sequence.caption:=Concat(inttostr(finalteamturns.Value),'X Finalround team');
      varF12shootredtime.caption:=Concat(inttostr(redfinalend.value),' sec');
    end;
  end;

end;





procedure TCountdownform.storeF;
begin
   AssignFile(settingsfile, Filespath+'scenarios/'+Fstore) ;
   ReWrite(settingsfile) ;

   writeln(settingsfile,archerysystem) ; //fita or 25m1p
   writeln(settingsfile,0) ;  //Fitafinal or fita/25m1p
   fitamode:=0;
   if topbot.checked=true then fitamode:=0;
   if oneone.checked=true then fitamode:=1;
   if onetwo.checked=true then fitamode:=2;
   if onethree.checked=true then fitamode:=3;
   if onefour.checked=true then fitamode:=4;
   if twotwo.checked=true then fitamode:=5;
   if onefive.checked=true then fitamode:=6;
   if onesix.checked=true then fitamode:=7;
   if twothree.checked=true then fitamode:=8;
   if threetwo.checked=true then fitamode:=9;
   writeln(settingsfile,fitamode) ; //fita mode (A, A-B, A-B-C, etc)
   writeln(settingsfile,nrofturns); //dubbele beurt of niet

   writeln(settingsfile,greentime.value); //seconds green Fita system
   writeln(settingsfile,orangetime.value); //seconds orange Fita system
   writeln(settingsfile,redtime.value); //seconds red Fita system

   writeln(settingsfile,greentimeso.value); //seconds green Fita shootoff
   writeln(settingsfile,orangetimeso.value); //seconds orange Fita shootoff
   writeln(settingsfile,redtimeso.value); //seconds red Fita shootoff

   writeln(settingsfile,greentime1p.value); //seconds green 25m1p system
   writeln(settingsfile,orangetime1p.value); //seconds orange 25m1p system
   writeln(settingsfile,redtime1p.value); //seconds red 25m1p system
   writeln(settingsfile,practiseturns.Value); // nr of practise ends Fita
   writeln(settingsfile,nrof1pshooters.Value); //archers per target 25m1p
   writeln(settingsfile,doubleturns.checked); //
   writeln(settingsfile,dbltime.checked); //
   writeln(settingsfile,dblturn.checked); //
   //add in v21
   writeln(settingsfile,showtarget.checked); //
   writeln(settingsfile,finarrow.checked); //
  // writeln(settingsfile,finname.checked); //
   writeln(settingsfile,'empty'); //
   writeln(settingsfile,timeperturn.checked); //
   writeln(settingsfile,timeperend.checked); //
   writeln(settingsfile,leftnumber.value); //
   writeln(settingsfile,rightnumber.value); //
   writeln(settingsfile,finalturns.value); //
   writeln(settingsfile,finalteamturns.value); //
   writeln(settingsfile,greenfinal.value); //
   writeln(settingsfile,orangefinal.value); //
   writeln(settingsfile,redfinal.value); //
   writeln(settingsfile,greenfinalend.value); //
   writeln(settingsfile,orangefinalend.value); //
   writeln(settingsfile,redfinalend.value); //
   writeln(settingsfile,BCDtoROG2.checked); //
   writeln(settingsfile,abcd25m1p.checked);
   writeln(settingsfile,ABCDperEND.checked);

   writeln(settingsfile,nrredbuzz.Value );
   writeln(settingsfile,nrorangebuzz.Value );
   writeln(settingsfile,nrgreenbuzz.Value );
   writeln(settingsfile,HWbutton1.ItemIndex );
   writeln(settingsfile,HWbutton2.ItemIndex );
   writeln(settingsfile,HWbutton3.ItemIndex );
   writeln(settingsfile,HWbutton4.ItemIndex );
   writeln(settingsfile,HWbutton5.ItemIndex );
   writeln(settingsfile,HWbutton5.ItemIndex );  //reservation for sixth button
   if leftscreen.Checked=true then writeln(settingsfile,'left')else writeln(settingsfile,'right');
   if serialinput.Checked=true then writeln(settingsfile,'followserial')else writeln(settingsfile,'followLAN');
   writeln(settingsfile,nrof1ppractisearrows.Value); // nr of practise arrows 25m1p
   writeln(settingsfile,viewleft.checked); //
   writeln(settingsfile,viewright.checked); //
   writeln(settingsfile,rotate25m1p.checked); //
   writeln(settingsfile,fromHOST.Text); //
   writeln(settingsfile,'dummy'); //reservation for future follow mode
   writeln(settingsfile,'dummy'); //reservation for future follow mode


   CloseFile(settingsfile) ;

end;


procedure TCountdownform.initsystemtype;   //change systemtype (Fita, fitafin,etc
begin
   NETWORK1.Disconnect;

  serienumber:=1;
  turnnumber:=1;
  FirstTimer.Enabled:=false;
  secondTimer.Enabled:=false;
  FirstTimer.Enabled:=false;
  secondTimer.Enabled:=false;
  countdowntimer:=0;
  countdowntimer2:=0;
  fitafinstartarcher:='none';
  fitafinarcher:='none';
  state:=1;
  leftscale:=100;
  rightscale:=100;
  updatemenu;

  if archerysystem='fita' then
  begin
    if practiseturns.Value=0 then Practiseturn:=0 else Practiseturn:=1;
    if doubleturns.checked=false then
    begin
      nrofturns:=1;
      times:=1;
      turnsss:=1
    end
    else
    begin
      nrofturns:=2;
      if dblturn.Checked=true then
      begin
        times:=1;
        turnsss:=2
      end;
      if dbltime.Checked=true then
      begin
        times:=2;
        turnsss:=1
      end;
    end;
    FITApanel.Visible:=true;
    FitaFinpanel.Visible:=false;
    onearrowpanel.Visible:=false;
    manualpannel.Visible:=false;
    followpannel.Visible:=false;
    if oneone.Checked=true then oneonesystem;
    if onetwo.checked=true then onetwosystem;
    if onethree.checked=true then onethreesystem;
    if onefour.checked=true then onefoursystem;
    if twotwo.checked=true then twotwosystem;
    if onefive.Checked=true then onefivesystem;
    if onesix.Checked=true then onesixsystem;
    if twothree.Checked=true then twothreesystem;

    if threetwo.Checked=true then threetwosystem;
    if topbot.Checked=true then topbotsystem;




  end;//archerysystem Fita

  if archerysystem='25m1p' then
  begin
      nrofturns:=1;
      times:=1;
      turnsss:=1;

    if nrof1ppractisearrows.Value=0 then Practiseturn:=0 else Practiseturn:=1;

    startupscenario.Text:='--';
    nrofturns:=1;
    turnsss:=1;
    times:=1;
    FITApanel.Visible:=false;
    FitaFinpanel.Visible:=false;
    onearrowpanel.Visible:=true;
    manualpannel.Visible:=false;
    followpannel.Visible:=false;
    Shooters:=nrof1pshooters.Value;
    Turnsperserie:=nrof1pshooters.Value;
    Archersperturn:=1;

    if turnnumber >  Turnsperserie then turnnumber:= Turnsperserie;


  end; //archerysystem 25m1p

  if archerysystem='fitafin' then
  begin


      Practiseturn:=0;
          FITApanel.Visible:=false;
    FitaFinpanel.Visible:=true;
    onearrowpanel.Visible:=false;
    manualpannel.Visible:=false;
    followpannel.Visible:=false;

  end; //archerysystem fitafin

  if (archerysystem= 'manual') or (archerysystem= 'follow') then
  begin
    Practiseturn:=0;
    FITApanel.Visible:=false;
    FitaFinpanel.Visible:=false;
    onearrowpanel.Visible:=false;

    followpannel.Visible:=false;

    nexticon.visible:=false;
    playpauzeicon.Visible:=false;
    stopicon.Visible:=false;
    turnup.Visible:=false;
    turndown.Visible:=false;
    seriedown.Visible:=false;
    serieup.Visible:=false;
    if archerysystem = 'manual' then
    begin
      manualpannel.Visible:=true;
      followpannel.Visible:=false;
      buzzicon1.Visible:=true;
      buzzicon2.Visible:=true;
      buzzicon3.Visible:=true;
      manualred.Visible:=true;
      manualorange.Visible:=true;
      manualgreen.Visible:=true;
      Danger.Visible:=true;
      if showhints.Checked=true then
      begin
        Practise.showhint:=true;
        serienr.showhint:=true;
      end;


    end
    else
    begin
      manualpannel.Visible:=false;
      followpannel.Visible:=true;
      buzzicon1.Visible:=false;
      buzzicon2.Visible:=false;
      buzzicon3.Visible:=false;
      manualred.Visible:=false;
      manualorange.Visible:=false;
      manualgreen.Visible:=false;
      Danger.Visible:=false;
      Practise.showhint:=false;
      serienr.showhint:=false;
      shooter1.ShowHint:=false;
      shooter2.ShowHint:=false;
      shooter3.ShowHint:=false;
      shooter4.ShowHint:=false;
      shooter5.ShowHint:=false;
      shooter6.ShowHint:=false;

    end;

  end
  else
  begin
    if hideicons.checked=false then
    begin
      nexticon.visible:=true;
      playpauzeicon.Visible:=true;
      stopicon.Visible:=true;
      turnup.Visible:=true;
      turndown.Visible:=true;
      seriedown.Visible:=true;
      serieup.Visible:=true;
      shooter1.ShowHint:=true;
      shooter2.ShowHint:=true;
      shooter3.ShowHint:=true;
      shooter4.ShowHint:=true;
      shooter5.ShowHint:=true;
      shooter6.ShowHint:=true;

    end;
    Danger.Visible:=true;
    if showhints.Checked=true then
    begin
      Practise.showhint:=true;
      serienr.showhint:=true;
    end;

    buzzicon1.Visible:=false;
    buzzicon2.Visible:=false;
    buzzicon3.Visible:=false;
    manualred.Visible:=false;
    manualorange.Visible:=false;
    manualgreen.Visible:=false;
    shooter1.ShowHint:=false;
    shooter2.ShowHint:=false;
    shooter3.ShowHint:=false;
    shooter4.ShowHint:=false;
    shooter5.ShowHint:=false;
    shooter6.ShowHint:=false;

  end;
  if archerysystem = 'follow' then
  begin
    Followlansettings;

  end;
  connectports;
  startupscenario.Text:='--';
  views;
  resizewindow;
end;

procedure TCountdownform.FITAClick(Sender: TObject);
begin
  archerysystem:='fita';
  initsystemtype;
end;

procedure TCountdownform.FITAFINClick(Sender: TObject);
begin
  FITAFIN.Checked:=true;
  archerysystem:='fitafin';
  initsystemtype;


end;



procedure TCountdownform.onepijlClick(Sender: TObject);
begin
  archerysystem:='25m1p';
  initsystemtype;
end;

procedure TCountdownform.closeimage1Click(Sender: TObject);
begin

  timeseqpanel.Visible:=false;
  views;
end;

procedure TCountdownform.redtimeChange(Sender: TObject);
begin
startupscenario.Text:='--';
end;

procedure TCountdownform.redtimesoChange(Sender: TObject);
begin
startupscenario.Text:='--';
end;

procedure TCountdownform.redtime1pChange(Sender: TObject);
begin
startupscenario.Text:='--';
end;


procedure TCountdownform.finnameClick(Sender: TObject);
begin

number.Visible:=false;
startupscenario.Text:='--';
end;

procedure TCountdownform.finarrowClick(Sender: TObject);
begin
  showtarget.Enabled:=true;
//number.Visible:=false;
startupscenario.Text:='--';
views;
resizewindow;
resizewindowfinals;
leftrightzoom.Enabled:=true;
end;

procedure TCountdownform.fintargetClick(Sender: TObject);
begin

number.Visible:=true;
startupscenario.Text:='--';
views
end;

procedure TCountdownform.numberClick(Sender: TObject);
begin

number.Visible:=true;
end;

procedure TCountdownform.dblturnClick(Sender: TObject);
begin
 if dblturn.Checked=true then
 begin
   times:=1;
   turnsss:=2
 end;
 showseq;
 showtime;
 startupscenario.Text:='--';
end;

procedure TCountdownform.dbltimeClick(Sender: TObject);
begin
 if dbltime.Checked=true then
 begin
   times:=2;
   turnsss:=1
 end;
 showseq;
 showtime;
 startupscenario.Text:='--';
end;


Procedure TCountdownform.removemenu;
begin
  cdmenu.caption:=CurrToStr(menuremovesec);
  cdmenu2.caption:=CurrToStr(menuremovesec);
  menuremovesec:=menuremovesec-1;

  if  menuremovesec<-1 then
  begin
    savesettings.Visible:=false;
    timeseqpanel.Visible:=false;
    prepsetpanel.Visible:=false;
    cdmenu.caption:=CurrToStr(menuremovedelay.Interval div 1000);
    cdmenu2.caption:=CurrToStr(menuremovedelay.Interval div 1000);
    menudisap1.Visible:=false;
    cdmenu.Visible:=false;
    disapsec1.Visible:=false;
    menudisap2.Visible:=false;
    cdmenu2.Visible:=false;
    disapsec2.Visible:=false;
    menuremovedelay.enabled:=false;
  end
  else
  begin
    menudisap1.Visible:=true;
    cdmenu.Visible:=true;
    disapsec1.Visible:=true;
    menudisap2.Visible:=true;
    cdmenu2.Visible:=true;
    disapsec2.Visible:=true;
    menuremovedelay.enabled:=true;
  end;
end;


procedure TCountdownform.menuremovedelayTimer(Sender: TObject);
//this timer is used to remove the menu when timer is running. Time left is visible via removemenu
begin
  removemenu;

end;

procedure TCountdownform.selectleftarcher;
begin
  fitafinarcher:='left';
  fitafinstartarcher:='left';
  if state <> 1 then
  begin
    
    FirstTimer.enabled:=true;
    secondTimer.Enabled:=false;
    countdowntimertmp:=countdowntimer;
    countdowntimer:=countdowntimer2;
    countdowntimer2:=countdowntimertmp;
  end;


  if finarrow.Checked=true then leftrightzoom.Enabled:=true;
  views;
end;

procedure TCountdownform.selectrightarcher;
begin
  fitafinarcher:='right';
  fitafinstartarcher:='right';
  if state <> 1 then
  begin

    FirstTimer.enabled:=false;
    secondTimer.Enabled:=true;
    countdowntimertmp:=countdowntimer;
    countdowntimer:=countdowntimer2;
    countdowntimer2:=countdowntimertmp;
  end;
  if finarrow.Checked=true then leftrightzoom.Enabled:=true;
  views;
end;

procedure TCountdownform.selectnonearcher;
begin
  
  if state = 1 then
  begin
    fitafinstartarcher:='none';
    fitafinarcher:='none';
    //leftrightzoom.Enabled:=true;
    if finarrow.Checked=true then leftrightzoom.Enabled:=true;
  end;
  
  views;
end;


procedure TCountdownform.greyleftClick(Sender: TObject);
begin
  if archerysystem<>'follow' then
  begin
    selectleftarcher;
  end;


end;

procedure TCountdownform.greyrightClick(Sender: TObject);
begin
  if archerysystem<>'follow' then
  begin
    selectrightarcher;
  end;



end;

procedure TCountdownform.finalchooseClick(Sender: TObject);
begin
  selectnonearcher;
end;

procedure TCountdownform.leftrightzoomTimer(Sender: TObject);
  //this timer is used to slow zoom the timers in final rounds when left to right or right to left changes.
begin
  if (fitafinarcher='right') then
  begin
    if (leftscale<100) then
    begin
      if leftscale < 80 then leftscale:=leftscale+20 else leftscale:=leftscale+4;
    end;
    if (rightscale>0) then
    begin
      if (rightscale > 80)and(leftscale<>100) then rightscale:=rightscale-4 else rightscale:=rightscale-20;
    end;
    if (rightscale <= 0) and (leftscale >= 100) then leftrightzoom.Enabled:=false;
  end;
  if (fitafinarcher='left')then
  begin
    if  (leftscale>0) then
    begin
      if (leftscale > 80)and(rightscale<>100) then leftscale:=leftscale-4 else leftscale:=leftscale-20;
    end;
    if (rightscale<100) then
    begin
      if rightscale < 80 then rightscale:=rightscale+20 else rightscale:=rightscale+4;
    end;
    if (rightscale >= 100) and (leftscale <= 0 ) then leftrightzoom.Enabled:=false;
  end;
  if (fitafinarcher='none') then
  begin
    if (rightscale<100) then
    begin
      rightscale:=rightscale+20;
    end;
    if  (leftscale<100) then
    begin
      leftscale:=leftscale+20;
    end;
    if (rightscale >= 100) and (leftscale >= 100) then leftrightzoom.Enabled:=false;

  end;
  resizewindow;
end;

procedure TCountdownform.secondTimerTimer(Sender: TObject);
//secondtimer is only used in finalrounds. Because other rounds only need 1 timer
//functionality of secondtimer is comparable to first timer
begin
  systemtime:=Now;
  begin

    if countdowntimer2> 1 then //actual time left is not 0
    begin
      checknextsecond;
      if nextsec=1 then
      begin
        referencetime:=IncSecond(referencetime, 1);  //decrease reference time with one second to triger the next count a second later
        countdowntimer2:=countdowntimer2-1;          //decrease the projected time with 1 second
        //if the projected time is equal to orange time setting, change to state 4: orange.
        if  ((countdowntimer2 = orangefinal.value)and (state=3)and (timeperturn.checked=true))and (state <>2) then  state:=4;
        if  ((countdowntimer2 = orangefinalend.value)and (state=3)and (timeperend.checked=true))and (state <>2) then  state:=4;
      end;
    end
    else
    begin  //actual time left is 0 so a state change is needed
      case state of
        1:    //waittime  , so change to red time (state 2)
        begin
          checknextsecond;
          if nextsec=1 then
          begin
            referencetime:=IncSecond(referencetime, 1);
            state:=2;
            soundsignal;
            if (timeperturn.checked=true) then countdowntimer:= redfinal.Value else countdowntimer:= redfinalend.Value;
            secondTimer.enabled:=true ;
          end;
        end;
        2:    //redtime , so change to green time (state 3)
        begin
          checknextsecond;
          if nextsec=1 then
          begin
            referencetime:=IncSecond(referencetime, 1);
            state:=3;
            soundsignal;
            if (archerysystem='fitafin')and (timeperturn.checked=true)then countdowntimer2:= (orangefinal.Value) +(greenfinal.value);
            if (archerysystem='fitafin')and (timeperend.checked=true)then countdowntimer2:= (orangefinalend.Value) +(greenfinalend.value);



             secondTimer.enabled:=true ;
          end;
        end;
        3:    //greentime. Can get in this situation in case orange setting is 0. Next state is depending if this is the last turn in this end or not. This is aranged in routine nextfinal
        begin
          checknextsecond;
          if nextsec=1 then
          begin
            referencetime:=IncSecond(referencetime, 1);
            nextfinal;
          end;
        end;
        4: //orangetime  Next state is depending if this is the last turn in this end or not. This is aranged in routine nextfinal
        begin
          checknextsecond;
          if nextsec=1 then
          begin
            referencetime:=IncSecond(referencetime, 1);
            nextfinal;

          end;

        end;
      End;  {End Case1}
    end;
    views; //change views with new state
  end;




end;

procedure TCountdownform.timeperendClick(Sender: TObject);
begin
  groupfinend.Visible:=true;
  finalteamturns.Visible:=true;
  groupfinarrow.Visible:=false;
  finalturns.Visible:=false;
  startupscenario.Text:='--';
end;

procedure TCountdownform.timeperturnClick(Sender: TObject);
begin
  groupfinend.Visible:=false;
  finalteamturns.Visible:=false;
  groupfinarrow.Visible:=true;
  finalturns.Visible:=true;
  startupscenario.Text:='--';
end;

procedure TCountdownform.greenfinalChange(Sender: TObject);
begin
totalfinal.Caption:= inttostr( trunc(orangefinal.value)+trunc(greenfinal.value));
startupscenario.Text:='--';

end;

procedure TCountdownform.orangefinalChange(Sender: TObject);
begin
totalfinal.Caption:= inttostr( trunc(orangefinal.value)+trunc(greenfinal.value));
startupscenario.Text:='--';

end;

procedure TCountdownform.greenfinalendChange(Sender: TObject);
begin
totalfinalend.Caption:= inttostr( trunc(orangefinalend.value)+trunc(greenfinalend.value));
startupscenario.Text:='--';

end;

procedure TCountdownform.orangefinalendChange(Sender: TObject);
begin
totalfinalend.Caption:= inttostr( trunc(orangefinalend.value)+trunc(greenfinalend.value));
startupscenario.Text:='--';

end;

procedure TCountdownform.digit3_2Click(Sender: TObject);
begin
  if (archerysystem='fitafin') and (finarrow.Checked=true) then selectrightarcher else hide;
end;

procedure TCountdownform.digit2_2Click(Sender: TObject);
begin
  if (archerysystem='fitafin') and (finarrow.Checked=true) then selectrightarcher else hide;

end;

procedure TCountdownform.dots_2Click(Sender: TObject);
begin
  if (archerysystem='fitafin') and (finarrow.Checked=true) then selectrightarcher else hide;

end;

procedure TCountdownform.digit1_2Click(Sender: TObject);
begin
  if (archerysystem='fitafin') and (finarrow.Checked=true) then selectrightarcher else hide;

end;

procedure TCountdownform.digit3_1Click(Sender: TObject);
begin
  if (archerysystem='fitafin') and (finarrow.Checked=true)  then selectleftarcher else hide;

end;

procedure TCountdownform.Changestartarcher;
begin
  if fitafinstartarcher='left'  then fitafinstartarcher:='right'
  else
  if fitafinstartarcher='right' then fitafinstartarcher:='left';
  views;
end;

procedure TCountdownform.rightstartClick(Sender: TObject);
begin
Changestartarcher;
end;

procedure TCountdownform.leftstartClick(Sender: TObject);
begin
Changestartarcher;
end;

procedure TCountdownform.finalturnsChange(Sender: TObject);
begin
if archerysystem='fitafin' then
if serienumber > finalturns.Value then
begin
  serienumber:=finalturns.Value;
  views;
  startupscenario.Text:='--';
end;
end;

procedure TCountdownform.leftnumberChange(Sender: TObject);
begin
lefttarget.Caption:=CurrToStr(leftnumber.Value);
end;

procedure TCountdownform.rightnumberChange(Sender: TObject);
begin
righttarget.Caption:=CurrToStr(rightnumber.Value);
end;

procedure TCountdownform.BCDtoROG2Click(Sender: TObject);
begin
if CardAddr=0 then switchbox;
startupscenario.Text:='--';
end;

procedure TCountdownform.savevarF8buttonClick(Sender: TObject);   //savevarF1buttonClick to savevarF12buttonClick  needs to be optimized to one procedure (not done yet because of priority reasons
begin
Fstore:='F8';
storeF;
showF8;
startupscenario.text:='F8';
end;





procedure TCountdownform.savevarF1buttonClick(Sender: TObject);  //savevarF1buttonClick to savevarF12buttonClick  needs to be optimized to one procedure (not done yet because of priority reasons

begin
Fstore:='F1';
storeF;
showF1;
startupscenario.text:='F1';


end;

procedure TCountdownform.savevarF2buttonClick(Sender: TObject);   //savevarF1buttonClick to savevarF12buttonClick  needs to be optimized to one procedure (not done yet because of priority reasons
begin
Fstore:='F2';
storeF;
showF2;
startupscenario.text:='F2';

end;

procedure TCountdownform.savevarF3buttonClick(Sender: TObject);  //savevarF1buttonClick to savevarF12buttonClick  needs to be optimized to one procedure (not done yet because of priority reasons
begin
Fstore:='F3';
storeF;
showF3;
startupscenario.text:='F3';

end;

procedure TCountdownform.savevarF4buttonClick(Sender: TObject); //savevarF1buttonClick to savevarF12buttonClick  needs to be optimized to one procedure (not done yet because of priority reasons
begin
Fstore:='F4';
storeF;
showF4;
startupscenario.text:='F4';

end;

procedure TCountdownform.savevarF5buttonClick(Sender: TObject);  //savevarF1buttonClick to savevarF12buttonClick  needs to be optimized to one procedure (not done yet because of priority reasons
begin
Fstore:='F5';
storeF;
showF5;
startupscenario.text:='F5';

end;

procedure TCountdownform.savevarF6buttonClick(Sender: TObject);  //savevarF1buttonClick to savevarF12buttonClick  needs to be optimized to one procedure (not done yet because of priority reasons
begin
Fstore:='F6';
storeF;
showF6;
startupscenario.text:='F6';

end;

procedure TCountdownform.savevarF7buttonClick(Sender: TObject); //savevarF1buttonClick to savevarF12buttonClick  needs to be optimized to one procedure (not done yet because of priority reasons
begin
Fstore:='F7';
storeF;
showF7;
startupscenario.text:='F7';

end;

procedure TCountdownform.savevarF9buttonClick(Sender: TObject);  //savevarF1buttonClick to savevarF12buttonClick  needs to be optimized to one procedure (not done yet because of priority reasons
begin
Fstore:='F9';
storeF;
showF9;
startupscenario.text:='F9';

end;

procedure TCountdownform.savevarF10buttonClick(Sender: TObject); //savevarF1buttonClick to savevarF12buttonClick  needs to be optimized to one procedure (not done yet because of priority reasons
begin
Fstore:='F10';
storeF;
showF10;
startupscenario.text:='F10';

end;

procedure TCountdownform.savevarF11buttonClick(Sender: TObject); //savevarF1buttonClick to savevarF12buttonClick  needs to be optimized to one procedure (not done yet because of priority reasons
begin
Fstore:='F11';
storeF;
showF11;
startupscenario.text:='F11';

end;

procedure TCountdownform.savevarF12buttonClick(Sender: TObject); //savevarF1buttonClick to savevarF12buttonClick  needs to be optimized to one procedure (not done yet because of priority reasons
begin
Fstore:='F12';
storeF;
showF12;
startupscenario.text:='F12';

end;

Procedure  TCountdownform.setvarsettings;
begin
  if FileExistsUTF8(Filespath+'scenarios/'+scenario)=true then
  begin
    AssignFile(scenariotextfile, Filespath+'scenarios/'+scenario) ;
    getsetting;
  end
  else
  begin
    Setsettings;
  end;
  startupscenario.Text:=scenario;
end;

procedure TCountdownform.varF1ButtonClick(Sender: TObject);
begin
  scenario:='F1';
  setvarsettings;
end;


procedure TCountdownform.varF2ButtonClick(Sender: TObject);
begin
  scenario:='F2';
  setvarsettings;
end;


procedure TCountdownform.varF3ButtonClick(Sender: TObject);
begin
  scenario:='F3';
  setvarsettings;
end;


procedure TCountdownform.varF4ButtonClick(Sender: TObject);
begin
  scenario:='F4';
  setvarsettings;
end;


procedure TCountdownform.varF5ButtonClick(Sender: TObject);
begin
  scenario:='F5';
  setvarsettings;
end;


procedure TCountdownform.varF6ButtonClick(Sender: TObject);
begin
  scenario:='F6';
  setvarsettings;
end;


procedure TCountdownform.varF7ButtonClick(Sender: TObject);
begin
  scenario:='F7';
  setvarsettings;
end;


procedure TCountdownform.varF8ButtonClick(Sender: TObject);
begin
  scenario:='F8';
  setvarsettings;
end;


procedure TCountdownform.varF9ButtonClick(Sender: TObject);
begin
  scenario:='F9';
  setvarsettings;
end;


procedure TCountdownform.varF10ButtonClick(Sender: TObject);
begin
  scenario:='F10';
  setvarsettings;
end;


procedure TCountdownform.varF11ButtonClick(Sender: TObject);
begin
  scenario:='F11';
  setvarsettings;
end;

procedure TCountdownform.varF12ButtonClick(Sender: TObject);
begin
  scenario:='F12';
  setvarsettings;
end;

procedure TCountdownform.redfinalChange(Sender: TObject);
begin
startupscenario.Text:='--';
end;

procedure TCountdownform.redfinalendChange(Sender: TObject);
begin
startupscenario.Text:='--';
end;

procedure TCountdownform.abcd25m1pClick(Sender: TObject);
begin
views;
end;

procedure TCountdownform.TLleftClick(Sender: TObject);
begin
resizewindow;
views;
end;

procedure TCountdownform.TLrightClick(Sender: TObject);
begin
resizewindow;
views;
end;



procedure TCountdownform.usetrafficClick(Sender: TObject);
begin
if usetraffic.checked=true then
begin
  TLleft.Enabled:=true;
  TLright.Enabled:=true;
end
else
begin
  TLleft.Enabled:=false;
  TLright.Enabled:=false;
end;

resizewindow;
views;
end;

procedure TCountdownform.soundselectChange(Sender: TObject);
begin
updatemenu;
end;

procedure TCountdownform.testsoundClick(Sender: TObject);
begin
 soundsignal;

end;

procedure TCountdownform.starttostart;
begin

  if ((endtimout.Enabled=false) or (precountalways.Checked ))and (alarmstate<>1) then
  begin
    countdowntimer:= tostart.Value*60;
    referencetime:=Now;

    FirstTimer.enabled:=false ;
    FirstTimer.enabled:=true ;


    state:=5;
    views;
  end;  
end;

procedure TCountdownform.starttocdClick(Sender: TObject);
begin
  starttostart;
  savesettings.Visible:=false;
end;

procedure TCountdownform.countdowntostartClick(Sender: TObject);
begin
starttostart;
end;

procedure TCountdownform.tostartChange(Sender: TObject);
begin
  countdowntostart.Caption:=(CurrToStr(tostart.value)+ ' '+Minabr);

end;

procedure TCountdownform.speakerClick(Sender: TObject);
begin
if speaker.checked=true then
begin
  selectsoundlabel.Enabled:=true;
  soundselect.Enabled:=true;
  testsound.Enabled:=true;
end
else
begin
  selectsoundlabel.Enabled:=false;
  soundselect.Enabled:=false;
  testsound.Enabled:=false;
end;

end;

procedure TCountdownform.updatemenu;
//update menu
begin
If showhints.checked=true then      //depending if "hints" are set to show or not, they are shown or hidden.
begin
  nexticon.showhint:=true;
  if archerysystem<>'follow'then
  begin
    Shooter1.showhint:=true;
    Shooter2.showhint:=true;
    Shooter3.showhint:=true;
    Shooter4.showhint:=true;
    Shooter5.showhint:=true;
    Shooter6.showhint:=true;
    greyleft.showhint:=true;
    greyright.showhint:=true;


  end
  else
  begin
    Shooter1.showhint:=false;
    Shooter2.showhint:=false;
    Shooter3.showhint:=false;
    Shooter4.showhint:=false;
    Shooter5.showhint:=false;
    Shooter6.showhint:=false;
    greyleft.showhint:=false;
    greyright.showhint:=false;

  end;

  seriedown.showhint:=true;
  serieup.showhint:=true;
  playpauzeicon.showhint:=true;
  stopicon.showhint:=true;
  SOicon.showhint:=true;
  preptime.showhint:=true;
  countdowntostart.showhint:=true;
  usb.showhint:=true;
  clockicon.showhint:=true;
  settings.showhint:=true;
  turndown.showhint:=true;
  turnup.showhint:=true;
  shooteronearrownr.showhint:=true;
  shooteronearrow.showhint:=true;
  if archerysystem <> 'follow' then Practise.showhint:=true;
  if archerysystem <> 'follow' then serienr.showhint:=true;
  closeicon.showhint:=true;
  resizeicon.showhint:=true;
  danger.ShowHint:=true;
  buzzicon3.ShowHint:=true;
  buzzicon2.ShowHint:=true;
  buzzicon1.ShowHint:=true;
  manualred.ShowHint:=true;
  manualorange.ShowHint:=true;
  manualgreen.ShowHint:=true;
  if archerysystem='manual' then
  begin
    TLredlefton.ShowHint:=true;
    TLredleftoff.ShowHint:=true;
    TLredrighton.ShowHint:=true;
    TLredrightoff.ShowHint:=true;
    TLorangelefton.ShowHint:=true;
    TLorangeleftoff.ShowHint:=true;
    TLorangerighton.ShowHint:=true;
    TLorangerightoff.ShowHint:=true;
    TLgrnlefton.ShowHint:=true;
    TLgrnleftoff.ShowHint:=true;
    TLgrnrighton.ShowHint:=true;
    TLgrnrightoff.ShowHint:=true;

  end
  else
  begin
    TLredlefton.ShowHint:=false;
    TLredleftoff.ShowHint:=false;
    TLredrighton.ShowHint:=false;
    TLredrightoff.ShowHint:=false;
    TLorangelefton.ShowHint:=false;
    TLorangeleftoff.ShowHint:=false;
    TLorangerighton.ShowHint:=false;
    TLorangerightoff.ShowHint:=false;
    TLgrnlefton.ShowHint:=false;
    TLgrnleftoff.ShowHint:=false;
    TLgrnrighton.ShowHint:=false;
    TLgrnrightoff.ShowHint:=false;

  end;

end
else
begin
  nexticon.showhint:=false;
  Shooter1.showhint:=false;
  Shooter2.showhint:=false;
  Shooter3.showhint:=false;
  Shooter4.showhint:=false;
  Shooter5.showhint:=false;
  Shooter6.showhint:=false;
  greyleft.showhint:=false;
  greyright.showhint:=false;
  seriedown.showhint:=false;
  serieup.showhint:=false;
  playpauzeicon.showhint:=false;
  stopicon.showhint:=false;
  SOicon.showhint:=false;
  preptime.showhint:=false;
  countdowntostart.showhint:=false;
  usb.showhint:=false;
  clockicon.showhint:=false;
  settings.showhint:=false;
  turndown.showhint:=false;
  turnup.showhint:=false;
  shooteronearrownr.showhint:=false;
  shooteronearrow.showhint:=false;
  Practise.showhint:=false;
  serienr.showhint:=false;
  closeicon.showhint:=false;
  resizeicon.showhint:=false;

  danger.ShowHint:=false;
  buzzicon3.ShowHint:=false;
  buzzicon2.ShowHint:=false;
  buzzicon1.ShowHint:=false;
  manualred.ShowHint:=false;
  manualorange.ShowHint:=false;
  manualgreen.ShowHint:=false;
  TLredlefton.ShowHint:=false;
  TLredleftoff.ShowHint:=false;
  TLredrighton.ShowHint:=false;
  TLredrightoff.ShowHint:=false;
  TLorangelefton.ShowHint:=false;
  TLorangeleftoff.ShowHint:=false;
  TLorangerighton.ShowHint:=false;
  TLorangerightoff.ShowHint:=false;
  TLgrnlefton.ShowHint:=false;
  TLgrnleftoff.ShowHint:=false;
  TLgrnrighton.ShowHint:=false;
  TLgrnrightoff.ShowHint:=false;



end;
//correct the wav file selection
  wavbuffer:=soundselect.Text;
  if  (wavbuffer = 'BELL1') or(wavbuffer = 'BEEP1') or (wavbuffer = 'BEEP2') or (wavbuffer = 'BEEP3') or (wavbuffer = 'BEEP4') or (wavbuffer = 'BEEP5') or (wavbuffer = 'BEEP6') or (wavbuffer = 'BEEP7') or (wavbuffer = 'buzzer1') or (wavbuffer = 'BUZZER2') or (wavbuffer = 'BUZZER3') or (wavbuffer = 'BUZZER4') or (wavbuffer = 'BUZZER5') or (wavbuffer = 'BUZZER6') or (wavbuffer = 'BUZZER7') or (wavbuffer = 'BUZZER8') or (wavbuffer = 'FLUTE1') or (wavbuffer = 'HORN1') or (wavbuffer = 'HORN2') or (wavbuffer = 'HORN3') or (wavbuffer = 'HORN4') or (wavbuffer = 'HORN5') or (wavbuffer = 'HORN6') or (wavbuffer = 'OINK1') or (wavbuffer = 'PLOINK1') then
  begin


  end
  else
  begin
    soundselect.Text:='buzzer';   //the chosen sound was not a valid sound so switched back to default sound.
  end;

end;

procedure TCountdownform.showhintsClick(Sender: TObject);
begin
updatemenu;
views;

end;

procedure TCountdownform.tabscenShow(Sender: TObject);
begin
 prepsetpanel.Visible:=true;
end;

procedure TCountdownform.tabscenHide(Sender: TObject);
begin
  prepsetpanel.Visible:=false;
end;



end.
.
