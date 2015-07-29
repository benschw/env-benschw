## Vim Notes

	5>>               - add tab to beginning of 5 lines
	<<                - deindent 
	5==               - reindent 5 lines
	]p                - use to paste text and align to destination context

	:so %             - run when editing vimrc to reload

	~                 - switch case

## misc

	:set syntax=yaml

### Misc Insert

	ctrl-n, ctrl-p    - next/previous word completion (similar word in current file)

	ctrl-x ctrl-l (ctrl-n/p)    - line completion

	:set dictionary=/usr/share/dict/words
	ctrl-x ctrl-k     - dictionary completion

	ctrl-w      - erases word (insert mode...)
	ctrl-u      - erases line  ...or on command line)

## Autocomplete

	<c-x><c-o>

	
## CTags
	
	apt-get install exuberant-ctags

	ctags -R src vendor

	<C-]>             jump to definition
	<C-t>             return to previous location
	:ts               shows listing
	:tn               goes to next tag in list
	:tp               goes to previous tag in list
	:tf               first tag in list
	:tl               last tag

## Buffers

	:enew	         - new empty buffer
	:bn              - (:bnext) cycle to next buffer
	:bp              - (:bprevious) cycle to previous buffer
	:b 2             - open buffer #2 in this window
	:ls              - show current buffers
	:bd              - close buffer without closing window

	:e filename      - edit another file
	:split filename  - split window and load another file
	:vsplit file     - vertical split
	ctrl-w UP        - (DOWN, LEFT, RIGHT) move cursor up a window
	ctrl-w ctrl-w    - move cursor to another window (cycle)
	ctrl-w_          - maximize current window
	ctrl-w=          - make all equal size
	10 ctrl-w+       - increase window size by 10 lines
	:sview file      - same as split, but readonly
	:hide            - close current window
	:only            - keep only this window open

## Searching

### For basic searching:

	/pattern       - search forward for pattern
	?pattern       - search backward
	n              - repeat forward search
	N              - repeat backward

### Some variables you might want to set:

	:set ignorecase - case insensitive
	:set smartcase  - use case if any caps used
	:set incsearch  - show match as search proceeds
	:set hlsearch   - search highlighting

### More cool searching tricks:

	*               - search for word currently under cursor
	g*              - search for partial word under cursor (repeat with n)
	ctrl-o, ctrl-i  - go through jump locations
	[I              - show lines with matching word under cursor

## Undo / Redo

	u       undo last change
	ctrl-R  redo last undo
	U       undo all changes on last modified line


## Cut and paste

	v  Select characters
	V    select whole line

	d    cut
	y    copy

	dd   cut line
	yy   copy line

	p    paste before cursor
	P    paste after cursor

	dl   cut letter
	d2l  cut 2 letters
	wip  cut word
	yl   yank letter
	y2l  yank 2 letters
	yiw  yank word


## Movement

	h  left
	j  down
	k  up
	l  right

	3w  Move forward three words.
	3b  Move backward three words.
	e   Move to the end of a word.

	$   Move to the end of the line.
	0   Move to the beginning of the line.
	^   Move to the first non-blank character of the line.
	)   Jump forward one sentence. (( for backwards)
	}   Jump forward one paragraph. ({ for backwards)

	H   Jump to the top of the screen.
	M   Jump to the middle of the screen.
	L   Jump to the bottom of the screen.

	5<C-b>     Move 5 pages up.
	5<C-f>     Move 5 pages down.

	gg  Jump to beginning of file (same as 1g)
	G   Jump to end of file.
	50G Jump to line 50.
	'm  Jump to the beginning of the line of mark m.
	`m  Jump to the cursor position of mark m.
	''  Return to the line where the cursor was before the latest jump. (Two single quotes.)
	``  Return to the cursor position before the latest jump (undo the jump). (Two back ticks)
	%   Jump to corresponding item, e.g. from an open brace to its matching closing brace.


