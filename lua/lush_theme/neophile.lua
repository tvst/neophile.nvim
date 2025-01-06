-- Built with Lush.
--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

-- Palette

local gray00 = "#000000"
local gray08 = "#080808"
local gray10 = "#101010"
local gray20 = "#202020"
local gray28 = "#282828"
local gray38 = "#383838"
local gray58 = "#585858"
local gray60 = "#606060"
local grayB8 = "#B8B8B8"
local grayD0 = "#D0D0D0"
local grayE0 = "#E0E0E0"

local brown = "#B08888"

local redDark = "#580808"
local red = "#F86060"
local redBright = "#FF8888"

local orangeDark = "#887020"
local orange = "#F8B060"
local orangeBright = "#F8E080"

local yellowDark = "#F8D800"
local yellow = "#F8E860"
local yellowBright = "#FFF0A0"

local lime = "#D8F838"

local greenDarker = "#085840"
local greenDark = "#38D090"
local green = "#58F8B0"
local greenBright = "#D0f8B8"

local teal = "#40A0B0"
local tealBright = "#A0EFFF"

local cyan = "#0078B8"
local cyanBright = "#48F8F8"

local blueDark = "#4880D0"
local blue = "#70C0FF"
local blueBright = "#A0D8FF"

local magenta = "#D80860"
local magentaBright = "#FF80A8"

local purple = "#B070B0"
local purpleBright = "#F8C0F8"

local fg = grayD0
local fgActive = grayB8
local fgInactive = gray60
local fgDarkContrast = gray08
local bg = gray10
local bgSeparators = bg
local bgPopup = gray28
local bgHighlighted = gray38
local bgRecessed = gray08

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    Normal { fg = fg, bg = bg }, -- Normal text
    ColorColumn { bg = bgRecessed }, -- Columns set with 'colorcolumn'
    Conceal { fg = fgInactive }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor { fg = fgDarkContrast, bg = lime }, -- Character under the cursor
    CurSearch { fg = cyan, bg = cyanBright }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    lCursor { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM { Cursor }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = bgHighlighted, blend = 0 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine { CursorColumn }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory { fg = blue, gui = "bold" }, -- Directory names (and other special names in listings)
    DiffAdd { fg = green, bg = greenDarker }, -- Diff mode: Added line |diff.txt|
    DiffChange { bg = bgHighlighted }, -- Diff mode: Changed line |diff.txt|
    DiffDelete { fg = redBright, bg = redDark }, -- Diff mode: Deleted line |diff.txt|
    DiffText { fg = orangeBright, bg = orangeDark }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer { fg = fgInactive }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor { Cursor }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    ErrorMsg { fg = magenta, gui = "bold" }, -- Error messages on the command line
    VertSplit { fg = fgInactive }, -- Column separating vertically split windows
    Folded { fg = fgInactive }, -- Line used for closed folds
    FoldColumn { Folded }, -- 'foldcolumn'
    SignColumn { fg = fgInactive }, -- Column where |signs| are displayed
    IncSearch { fg = cyanBright, bg = cyan }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    LineNr { Normal }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove { fg = fgInactive }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow { fg = fgInactive }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr { fg = fgActive, bg = bgHighlighted }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineFold { fg = fgActive, bg = bgHighlighted }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    CursorLineSign { fg = fgActive, bg = bgHighlighted }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen { fg = cyanBright, bg = cyan, gui="bold" }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg { fg = blue }, -- |more-prompt|
    NonText { fg = fgInactive }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    NormalFloat { fg = fg, blend = 0 }, -- Normal text in floating windows.
    FloatBorder { }, -- Border of floating windows.
    -- FloatTitle     { }, -- Title of floating windows.
    -- NormalNC       { fg = fgInactive }, -- normal text in non-current windows
    Pmenu { fg = fg, bg = bgPopup, blend = 0 }, -- Popup menu: Normal item.
    PmenuSel { Cursor }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    PmenuSbar { Pmenu }, -- Popup menu: Scrollbar.
    PmenuThumb { bg = fgInactive }, -- Popup menu: Thumb of the scrollbar.
    Question { fg = magenta, gui = "bold" }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { fg = blue }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search { fg = purpleBright, bg = magenta }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey { fg = yellowDark, gui = "bold" }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad { fg = magenta, gui = "underdotted" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap { SpellBad }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine { fg = fgActive, bg = bgSeparators }, -- Status line of current window
    StatusLineNC { fg = fgInactive, bg = bgSeparators }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    ModeMsg { StatusLine }, -- 'showmode' message (e.g., "-- INSERT -- ")
    TabLine { fg = fgInactive }, -- Tab pages line, not active tab page label
    TabLineFill { fg = fgInactive }, -- Tab pages line, where there are no labels
    TabLineSel { StatusLine }, -- Tab pages line, active tab page label
    Title { gui = "" }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual { fg = cyanBright, bg = cyan }, -- Visual mode selection
    VisualNOS { fg = cyanBright, bg = cyan }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg { fg = magenta, gui = "bold" }, -- Warning messages
    Whitespace { fg = yellowDark }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator   { fg = fgInactive }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu { Cursor }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- NeoTree colors
    NeoTreeFileName { fg = fg },
    NeoTreeGitModified { fg = orange },
    NeoTreeGitUntracked { fg = orange },
    NeoTreeGitDeleted { gui="strikethrough" },
    NeoTreeStaged { fg = green },  -- icon
    NeoTreeGitUnstaged { fg = orange },  -- icon
    NeoTreeGitIgnored { fg = fgInactive },
    NeoTreeCursorLine { bg = bgHighlighted },
    NeoTreeTitleBar { fg = bg, bg = blue },
    NeoTreeFloatBorder { fg = blue },

    -- WhichKey colors
    WhichKey { Normal },
    WhichKeyBorder { fg = blue },
    WhichKeyGroup { fg = blue },
    WhichKeyDesc { fg = blue },
    WhichKeySeparator { fg = fgInactive },

    -- Fugitive status pane diffs
    DiffAdded { fg = green },
    DiffRemoved { fg = redBright },

    -- Fzf
    FzfLuaBorder { fg = blue },

    -- GitSign colors
    GitSignsAdd { fg = green },
    GitSignsChange { fg = orange },
    GitSignsDelete { fg = magenta },
    -- GitSignsChangedelete {},
    -- GitSignsTopdelete {},
    -- GitSignsUntracked {},
    -- GitSignsAddNr {},
    -- GitSignsChangeNr {},
    -- GitSignsDeleteNr {},
    -- GitSignsChangedeleteNr {},
    -- GitSignsTopdeleteNr {},
    -- GitSignsUntrackedNr {},
    -- GitSignsAddLn {},
    -- GitSignsChangeLn {},
    -- GitSignsChangedeleteLn {},
    -- GitSignsUntrackedLn {},
    -- GitSignsAddCul {},
    -- GitSignsChangeCul {},
    -- GitSignsDeleteCul {},
    -- GitSignsChangedeleteCul {},
    -- GitSignsTopdeleteCul {},
    -- GitSignsUntrackedCul {},
    -- GitSignsAddPreview {},
    -- GitSignsDeletePreview {},
    -- GitSignsCurrentLineBlame {},
    -- GitSignsAddInline {},
    -- GitSignsDeleteInline {},
    -- GitSignsChangeInline {},
    -- GitSignsAddLnInline {},
    -- GitSignsChangeLnInline {},
    -- GitSignsDeleteLnInline {},
    -- GitSignsDeleteVirtLn {},
    -- GitSignsDeleteVirtLnInLine {},
    -- GitSignsVirtLnum {},


    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment { fg = brown, gui = "italic" }, -- Any comment

    String { fg = blue }, --   A string constant: "this is a string"
    Character { fg = green }, --   A character constant: 'c', '\n'
    Number { fg = green }, --   A number constant: 234, 0xff
    Boolean { fg = green }, --   A boolean constant: TRUE, false
    Float { fg = greenBright }, --   A floating point constant: 2.3e10

    Identifier { fg = fg }, -- (*) Any variable name
    Constant { fg = green }, -- (*) Any constant
    FunctionCall { fg = orange }, -- Custom highlight for function calls.
    Function { FunctionCall }, --   Function name (also: methods for classes)
    FunctionDeclaration { fg = blue, gui = "bold" }, -- Custom highlight for declarations.

    Statement { fg = purple }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    -- Exception      { }, --   try, catch, throw
    -- Keyword        { }, --   any other keyword
    Operator { fg = magenta }, --   "sizeof", "+", "*", etc.

    PreProc { fg = blueDark }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type { fg = blue }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special { fg = orange }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements
    Delimiter { fg = redBright }, --   Character that needs attention

    Underlined     { }, -- Text that stands out, HTML links
    Ignore         { fg = fgInactive }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error { fg = redBright, bg = redDark, gui = "underdotted" }, -- Any erroneous construct
    -- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    LspReferenceText { bg = bgHighlighted }, -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError { fg = red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn { fg = brown }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo { fg = blue }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint { fg = orangeBright }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk { fg = green }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    DiagnosticUnderlineError   { gui = "underdotted" } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { gui = "underdotted" } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { gui = "underdotted" } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { gui = "underdotted" } , -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk      { gui = "underdotted" } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    DiagnosticSignWarn { fg = orange }, -- Used for "Warn" signs in sign column.
    DiagnosticSignInfo { fg = blue }, -- Used for "Info" signs in sign column.
    DiagnosticSignHint { fg = blue }, -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    sym"@constant.builtin"  { gui = "italic" }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    sym"@float"             { Float }, -- Float
    sym"@field"             { fg = blue }, -- Identifier
    -- sym"@variable"          { Identifier }, -- Identifier
    -- sym"@function"          { Function }, -- Function
    sym"@function.builtin"  { gui = "italic" },
    sym"@attribute.builtin"  { gui = "italic" },
    sym"@function.macro"    { PreProc }, -- Macro
    sym"@parameter"         { fg = blueBright }, -- Identifier
    sym"@variable.parameter" { fg = blueBright }, -- Identifier
    -- sym"@method"            { Function }, -- Function
    sym"@property"          { fg = blue }, -- Identifier
    -- sym"@constructor"       { FunctionCall }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    sym"@tag"               { FunctionCall }, -- HTML Tag
    sym"@tag.delimiter"               { Delimiter }, -- HTML Tag delimeter
    sym"@tag.attribute"               { fg = blueBright },
    sym"@function.python"        { FunctionDeclaration },
    sym"@lsp.typemod.class.declaration" { FunctionDeclaration, fg = purpleBright },
    sym"@lsp.typemod.method.declaration" { FunctionDeclaration },
    sym"@lsp.typemod.function.declaration" { FunctionDeclaration },
    sym"@lsp.typemod.interface.declaration" { FunctionDeclaration },
    DiagnosticUnnecessary { gui = "underdotted" },  -- Remove italic from Comment
    -- sym"@function.method.call"        { FunctionCall },
    -- sym"@function.function.call"      { FunctionCall },
    -- sym"@function.call"        { FunctionCall },
    -- sym"@constructor"        { FunctionCall },
    sym"@type.builtin"  { fg = blue, gui = "italic" }, -- Builtins are italic
    sym"@variable.builtin"  { gui = "italic"}, -- Builtins are italic
 }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
