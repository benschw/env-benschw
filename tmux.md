## tmux

### Basic
	tmux -2 new -s <name>
	tmux attach -t <name>
	tmux detach (<cb>+d)
	tmux ls
	tmux kill-session <name>

### Panes
	<cb>%      vertical split
	<cb>"      horizontal split
	<cb>q      show pane numbers

	<cb>UP     (DOWN, LEFT, RIGHT) navigate panes
	<cb>;      previous pane
	<cb><co>   rotate pane positions

	<cb>z      "zoom" pane in or out
	
	<cb>{     (or }) swap panes
	
	<cb><c+UP> (DOWN, LEFT, RIGHT) resize current pane

	<cb>x      close current pane

	
### Windows
	
	<cb>c      new window
	<cb>,      name current window
	<cb>w      interactively select window
	<cb>n      next window
	<cb>p      prev window
	<cb>&      close current window


### Navigating Buffer
	
	<cb>[      switch mode so up, down, pgup etc navigate through buffer
	<cb>space  start capturing text for copy
	ALT+w      copy selected text
	<cb>]      paste text
	ESC        exit this mode
 
