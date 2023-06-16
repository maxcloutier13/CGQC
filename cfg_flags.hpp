// Flags
class FlagCarrier;
class cgqc_flag_coop_black : FlagCarrier
{
    author = "silent1";
    class SimpleObject
    {
        eden = 0;
        animate[] = {{"flag", 0}};
        hide[] = {};
        verticalOffset = 3.977;
        verticalOffsetWorld = 0;
        init = "''";
    };
    editorPreview = "cgqc\pics\cgqc_flag_coop_black.jpg";
    _generalMacro = "cgqc_flag_coop_black";
    scope = 2;
    scopeCurator = 2;
    displayName = "CGQC Drapeau COOP noir";
    class EventHandlers
    {
        init = "(_this select 0) setFlagTexture '\CGQC\flags\cgqc_flag_coop_black.paa'";
    };
};
class cgqc_flag_coop_white : FlagCarrier
{
    author = "silent1";
    class SimpleObject
    {
        eden = 0;
        animate[] = {{"flag", 0}};
        hide[] = {};
        verticalOffset = 3.977;
        verticalOffsetWorld = 0;
        init = "''";
    };
    editorPreview = "cgqc\pics\cgqc_flag_coop_white.jpg";
    _generalMacro = "cgqc_flag_coop_white";
    scope = 2;
    scopeCurator = 2;
    displayName = "CGQC Drapeau COOP blanc";
    class EventHandlers
    {
        init = "(_this select 0) setFlagTexture '\CGQC\flags\cgqc_flag_coop_white.paa'";
    };
};
class cgqc_flag_logo_black : FlagCarrier
{
    author = "silent1";
    class SimpleObject
    {
        eden = 0;
        animate[] = {{"flag", 0}};
        hide[] = {};
        verticalOffset = 3.977;
        verticalOffsetWorld = 0;
        init = "''";
    };
    editorPreview = "cgqc\pics\cgqc_flag_logo_black.jpg";
    _generalMacro = "cgqc_flag_logo_black";
    scope = 2;
    scopeCurator = 2;
    displayName = "CGQC Drapeau Logo noir";
    class EventHandlers
    {
        init = "(_this select 0) setFlagTexture '\CGQC\flags\cgqc_flag_logo_black.paa'";
    };
};
class cgqc_flag_logo_white : FlagCarrier
{
    author = "silent1";
    class SimpleObject
    {
        eden = 0;
        animate[] = {{"flag", 0}};
        hide[] = {};
        verticalOffset = 3.977;
        verticalOffsetWorld = 0;
        init = "''";
    };
    editorPreview = "cgqc\pics\cgqc_flag_logo_white.jpg";
    _generalMacro = "cgqc_flag_logo_white";
    scope = 2;
    scopeCurator = 2;
    displayName = "CGQC Drapeau Logo blanc";
    class EventHandlers
    {
        init = "(_this select 0) setFlagTexture '\CGQC\flags\cgqc_flag_logo_white.paa'";
    };
};
class cgqc_flag_airforce_black : FlagCarrier
{
    author = "silent1";
    class SimpleObject
    {
        eden = 0;
        animate[] = {{"flag", 0}};
        hide[] = {};
        verticalOffset = 3.977;
        verticalOffsetWorld = 0;
        init = "''";
    };
    editorPreview = "cgqc\pics\cgqc_flag_airforce_black.jpg";
    _generalMacro = "cgqc_flag_airforce_black";
    scope = 2;
    scopeCurator = 2;
    displayName = "CGQC Drapeau Airforce noir";
    class EventHandlers
    {
        init = "(_this select 0) setFlagTexture '\CGQC\flags\cgqc_flag_airforce_black.paa'";
    };
};
class cgqc_flag_airforce_white : FlagCarrier
{
    author = "silent1";
    class SimpleObject
    {
        eden = 0;
        animate[] = {{"flag", 0}};
        hide[] = {};
        verticalOffset = 3.977;
        verticalOffsetWorld = 0;
        init = "''";
    };
    editorPreview = "cgqc\pics\cgqc_flag_airforce_white.jpg";
    _generalMacro = "cgqc_flag_airforce_white";
    scope = 2;
    scopeCurator = 2;
    displayName = "CGQC Drapeau Airforce blanc";
    class EventHandlers
    {
        init = "(_this select 0) setFlagTexture '\CGQC\flags\cgqc_flag_airforce_white.paa'";
    };
};
class cgqc_flag_black_black : FlagCarrier
{
    author = "silent1";
    class SimpleObject
    {
        eden = 0;
        animate[] = {{"flag", 0}};
        hide[] = {};
        verticalOffset = 3.977;
        verticalOffsetWorld = 0;
        init = "''";
    };
    editorPreview = "cgqc\pics\cgqc_flag_black_black.jpg";
    _generalMacro = "cgqc_flag_black_black";
    scope = 2;
    scopeCurator = 2;
    displayName = "CGQC Drapeau Logo noir/noir";
    class EventHandlers
    {
        init = "(_this select 0) setFlagTexture '\CGQC\flags\cgqc_flag_black_black.paa'";
    };
};
class cgqc_flag_black_white : FlagCarrier
{
    author = "silent1";
    class SimpleObject
    {
        eden = 0;
        animate[] = {{"flag", 0}};
        hide[] = {};
        verticalOffset = 3.977;
        verticalOffsetWorld = 0;
        init = "''";
    };
    editorPreview = "cgqc\pics\cgqc_flag_black_white.jpg";
    _generalMacro = "cgqc_flag_black_white";
    scope = 2;
    scopeCurator = 2;
    displayName = "CGQC Drapeau Logo noir/blanc";
    class EventHandlers
    {
        init = "(_this select 0) setFlagTexture '\CGQC\flags\cgqc_flag_black_white.paa'";
    };
};

// Banners
class Banner_01_base_F;
class cgqc_banner_coop_black : Banner_01_base_F
{
    author = "silent1";
    class SimpleObject
    {
        eden = 0;
        animate[] = {};
        hide[] = {};
        verticalOffset = 0.469;
        verticalOffsetWorld = 0;
        init = "''";
    };
    editorPreview = "cgqc\pics\cgqc_banner_coop_black.jpg";
    _generalMacro = "cgqc_banner_coop_black";
    scope = 2;
    scopeCurator = 2;
    displayName = "CGQC Bannière COOP Noir";
    hiddenSelectionsTextures[] = {"CGQC\flags\cgqc_flag_coop_black.paa"};
};
class cgqc_banner_coop_white : Banner_01_base_F
{
    author = "silent1";
    class SimpleObject
    {
        eden = 0;
        animate[] = {};
        hide[] = {};
        verticalOffset = 0.469;
        verticalOffsetWorld = 0;
        init = "''";
    };
    editorPreview = "cgqc\pics\cgqc_banner_coop_white.jpg";
    _generalMacro = "cgqc_banner_coop_white";
    scope = 2;
    scopeCurator = 2;
    displayName = "CGQC Bannière COOP Blanc";
    hiddenSelectionsTextures[] = {"CGQC\flags\cgqc_flag_coop_white.paa"};
};
class cgqc_banner_logo_black : cgqc_banner_coop_black
{
    _generalMacro = "cgqc_banner_logo_black";
    displayName = "CGQC Bannière Logo Noir";
    editorPreview = "cgqc\pics\cgqc_banner_logo_black.jpg";
    hiddenSelectionsTextures[] = {"CGQC\flags\cgqc_flag_logo_black.paa"};
};
class cgqc_banner_logo_white : cgqc_banner_coop_black
{
    _generalMacro = "cgqc_banner_logo_white";
    displayName = "CGQC Bannière Logo blanc";
    editorPreview = "cgqc\pics\cgqc_banner_logo_white.jpg";
    hiddenSelectionsTextures[] = {"CGQC\flags\cgqc_flag_logo_white.paa"};
};

// Posters
class UserTexture1m_F;
class UserTexture_1x2_F;
class UserTexture10m_F;
class cgqc_texture_1m: UserTexture1m_F
{
    _generalMacro = "cgqc_texture_1m";
    scope = 0;
    displayName = "CGQC texture 1m";
    editorCategory = "EdCat_Signs";
    editorSubcategory = "EdSubcat_CGQCSigns";
};
class cgqc_texture_1x2m: UserTexture1m_F
{
    _generalMacro = "cgqc_texture_1x2m";
    scope = 0;
    displayName = "CGQC texture 1x2m";
    editorCategory = "EdCat_Signs";
    editorSubcategory = "EdSubcat_CGQCSigns";
};
class cgqc_texture_10m: UserTexture10m_F
{
    _generalMacro = "cgqc_texture_10m";
    scope = 0;
    displayName = "CGQC texture 10m";
    editorCategory = "EdCat_Signs";
    editorSubcategory = "EdSubcat_CGQCSigns";
};

class cgqc_poster_qrcode: cgqc_texture_1m
{
    scope = 2;
    displayName = "CGQC Documentation QRcode";
    hiddenSelectionsTextures[] = {"CGQC\textures\poster_training_qr.paa"};
};

class cgqc_poster_title_arsenal: cgqc_texture_1x2m
{
    scope = 2;
    displayName = "CGQC Documentation QRcode";
    hiddenSelectionsTextures[] = {"CGQC\textures\poster_training_qr.paa"};
};

class cgqc_poster_title_classroom: cgqc_texture_1x2m
{
    scope = 2;
    displayName = "CGQC Documentation QRcode";
    hiddenSelectionsTextures[] = {"CGQC\textures\poster_training_qr.paa"};
};

class cgqc_poster_title_medical: cgqc_texture_1x2m
{
    scope = 2;
    displayName = "CGQC Documentation QRcode";
    hiddenSelectionsTextures[] = {"CGQC\textures\poster_training_qr.paa"};
};

class cgqc_poster_info_arsenal: cgqc_texture_1x2m
{
    scope = 2;
    displayName = "CGQC Documentation QRcode";
    hiddenSelectionsTextures[] = {"CGQC\textures\poster_training_qr.paa"};
};

class cgqc_poster_info_training: cgqc_texture_1x2m
{
    scope = 2;
    displayName = "CGQC Documentation QRcode";
    hiddenSelectionsTextures[] = {"CGQC\textures\poster_training_qr.paa"};
};

class cgqc_poster_info_training_utils: cgqc_texture_1x2m
{
    scope = 2;
    displayName = "CGQC Documentation QRcode";
    hiddenSelectionsTextures[] = {"CGQC\textures\poster_training_qr.paa"};
};

class cgqc_poster_info_perks1: cgqc_texture_1x2m
{
    scope = 2;
    displayName = "CGQC Documentation QRcode";
    hiddenSelectionsTextures[] = {"CGQC\textures\poster_training_qr.paa"};
};

class cgqc_poster_info_perks2: cgqc_texture_1x2m
{
    scope = 2;
    displayName = "CGQC Documentation QRcode";
    hiddenSelectionsTextures[] = {"CGQC\textures\poster_training_qr.paa"};
};

class cgqc_poster_airforce: cgqc_texture_10m
{
    scope = 2;
    displayName = "CGQC Documentation QRcode";
    hiddenSelectionsTextures[] = {"CGQC\textures\poster_training_qr.paa"};
};

class cgqc_poster_cgqc_black: cgqc_texture_10m
{
    scope = 2;
    displayName = "CGQC Documentation QRcode";
    hiddenSelectionsTextures[] = {"CGQC\textures\poster_training_qr.paa"};
};

class cgqc_poster_quiet: cgqc_texture_10m
{
    scope = 2;
    displayName = "CGQC Documentation QRcode";
    hiddenSelectionsTextures[] = {"CGQC\textures\poster_training_qr.paa"};
};

class cgqc_poster_bros: cgqc_texture_10m
{
    scope = 2;
    displayName = "CGQC Documentation QRcode";
    hiddenSelectionsTextures[] = {"CGQC\textures\poster_training_qr.paa"};
};

class cgqc_poster_coop: cgqc_texture_10m
{
    scope = 2;
    displayName = "CGQC Documentation QRcode";
    hiddenSelectionsTextures[] = {"CGQC\textures\poster_training_qr.paa"};
};