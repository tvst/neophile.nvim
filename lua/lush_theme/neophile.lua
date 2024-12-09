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

local gray00 = "#000000"
local gray08 = "#080808"
local gray10 = "#101010"
local gray28 = "#282828"
local gray38 = "#383838"
local gray58 = "#585858"
local grayB8 = "#B8B8B8"
local grayD0 = "#D0D0D0"

local lime = "#D8F838"

local greenDark = "#085828"
local green = "#50F888"
local greenLight = "#e0f888"

local emerald = "#58F8B0"

local brown = "#B08888"

local orangeDark = "#887020"
local orange = "#f8b060"
local orangeLight = "#f8e080"

local redDark = "#580808"
local red = "#f83030"
local redLight = "#ff8888"

local teal = "#0078A8"
local tealLight = "#58F8F8"

local blue = "#60B0F8"
local blueLight = "#A0D0F8"

local magenta = "#d80860"

local pink = "#B060B0"
local pinkLight = "#F8C0F8"

local gold = "#f8d800"

local fg = grayD0
local fgInactive = gray58
local fgActive = grayB8
local fgDarkContrast = gray08
local bg = gray10
local bgPopup = gray28
local bgHighlighted = gray38
local bgRecessed = gray00

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
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor { fg = fgDarkContrast, bg = lime }, -- Character under the cursor
    -- CurSearch { fg = teal60, bg = teal30 }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    lCursor { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM { Cursor }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = bgHighlighted, blend = 0 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine { CursorColumn }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory { fg = blueLight, gui = "bold" }, -- Directory names (and other special names in listings)
    DiffAdd { fg = green, bg = greenDark }, -- Diff mode: Added line |diff.txt|
    DiffChange { bg = bgHighlighted }, -- Diff mode: Changed line |diff.txt|
    DiffDelete { fg = redLight, bg = redDark }, -- Diff mode: Deleted line |diff.txt|
    DiffText { fg = orangeLight, bg = orangeDark }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer { fg = fgInactive }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor { Cursor }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    ErrorMsg { fg = magenta, gui = "bold" }, -- Error messages on the command line
    VertSplit { }, -- Column separating vertically split windows
    Folded { fg = fgInactive }, -- Line used for closed folds
    FoldColumn { Folded }, -- 'foldcolumn'
    SignColumn { fg = fgInactive }, -- Column where |signs| are displayed
    IncSearch { fg = tealLight, bg = teal }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    LineNr { Normal }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove { fg = fgInactive }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow { fg = fgInactive }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr { fg = fgActive, bg = bgHighlighted }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineFold { fg = fgActive, bg = bgHighlighted }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    CursorLineSign { fg = fgActive, bg = bgHighlighted }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen { fg = tealLight, bg = bgHighlighted }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg { fg = blueLight }, -- |more-prompt|
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
    QuickFixLine { fg = blueLight }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search { fg = pinkLight, bg = magenta }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey { fg = gold, gui = "bold" }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad { fg = magenta, gui = "underline" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap { SpellBad }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine { fg = fgActive, bg = bg }, -- Status line of current window
    StatusLineNC { fg = fgInactive, bg = bg }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    ModeMsg { StatusLine }, -- 'showmode' message (e.g., "-- INSERT -- ")
    TabLine { fg = fgInactive }, -- Tab pages line, not active tab page label
    TabLineFill { fg = fgInactive }, -- Tab pages line, where there are no labels
    TabLineSel { StatusLine }, -- Tab pages line, active tab page label
    -- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual { fg = tealLight, bg = teal }, -- Visual mode selection
    VisualNOS { fg = tealLight, bg = teal }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg { fg = magenta, gui = "bold" }, -- Warning messages
    Whitespace { fg = gold }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu { Cursor }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- NeoTree colors
    NeoTreeFileName { fg = fg },
    NeoTreeGitModified { fg = fg },
    NeoTreeGitDeleted { fg = magenta },
    NeoTreeGitUnstaged { fg = orange },
    NeoTreeStaged { fg = green },
    NeoTreeGitIgnored { fg = fgInactive },
    NeoTreeCursorLine { bg = bgHighlighted },

    -- WhichKey colors
    WhichKey { Normal },
    WhichKeyGroup { fg = magenta },
    WhichKeyDesc { fg = blue },
    WhichKeySeparator { fg = fgInactive },

    -- Fugitive status pane diffs
    DiffAdded { fg = green },
    DiffRemoved { fg = redLight },

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

    Comment { fg = brown }, -- Any comment

    Constant { fg = blueLight }, -- (*) Any constant
    String { fg = blueLight }, --   A string constant: "this is a string"
    Character { fg = emerald }, --   A character constant: 'c', '\n'
    Number { fg = greenLight }, --   A number constant: 234, 0xff
    Boolean { fg = greenLight }, --   A boolean constant: TRUE, false
    Float { fg = emerald }, --   A floating point constant: 2.3e10

    Identifier { fg = pinkLight }, -- (*) Any variable name
    Function { fg = blue }, --   Function name (also: methods for classes)

    Statement { fg = pink }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    -- Exception      { }, --   try, catch, throw
    -- Keyword        { }, --   any other keyword
    Operator { fg = magenta }, --   "sizeof", "+", "*", etc.

    PreProc { fg = red }, -- (*) Generic Preprocessor
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
    Delimiter { fg = redLight }, --   Character that needs attention

    -- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error { fg = redLight, bg = redDark, gui = "underline" }, -- Any erroneous construct
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
    DiagnosticHint { fg = orangeLight }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk { fg = emerald }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
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
    -- sym"@constant.builtin"  { }, -- Special
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
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
 }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
