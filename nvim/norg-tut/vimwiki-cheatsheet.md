# VimWiki Cheatsheet

_[number] refers to the wiki number, set by the order in your vimrc. The default is 1._

## Wiki Management

- [number] `<leader> ww` - open wiki index file
- [number] `<leader> wt` - open wiki index file in new tab
- `<leader> ws` - list and select available wikis
- `<leader> wd` - delete wiki page
- `<leader> wr` - rename wiki page

## Diary management

- [number] `<leader> wi` - open diary index file for wiki
- `<leader> w <leader> i` - update current diary index
- [number] `<leader> w <leader> w` - open today’s diary file for wiki
- [number] `<leader> w <leader> t` - open today’s diary file for wiki in new tab
- `<C-Up>` - open previous day’s diary
- `<C-Down>` - open next day’s diary

## Navigation

- `<CR>` - follow/create wiki link
- `<C-S-CR>` - follow/create wiki link in new tab
- `<backspace>` - go back to previous wiki page
- `<Tab>` - go to next link on current page
- `<S-Tab>` - go to previous link on current page

## Editing shortcuts

- `<C-Space>` - toggle list item on/off
- `=`	- add header level
- `-`	- remove header level
- `+`	- create/decorate links
- `glm`	- increase indent of list item
- `gll`	- decrease indent of list item
- `gl*` or `gl8` - switch or insert “*” symbol
- `gl#` or `gl3` - switch or insert “#” symbol
- `gl-`	- switch or insert “-“ symbol
- `gl1`	- switch or insert “1.” symbol

## Table shortcuts

- `<A-Left>`	move column left
- `<A-right>`	move column right
- `<CR>`	(insert mode) go down/create cell
- `<Tab>`	(insert mode) go next/create cell
- `gqq` or `gww`	reformat table

## Text objects

`ah`	section between 2 headings including empty trailing lines
`ih`	section between 2 headings excluding empty trailing lines
`a\`	table cell
`i\`	inner table cell
`ac`	table column
`ic`	inner table column




**BOld**
*italic* 
__undrleine__


