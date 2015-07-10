# Emacs configuration of mine
This is my emacs configuration for learning emacs.

I have only used it on Archlinux distro, however, it should be supported by other linux distributions.

# Quick Start
Backup yours emacs configure files like `~/.emacs, ~/.emacs.d.`

Clone it to your $HOME/.emacs.d:

	git clone  https://github.com/Zexi/emacs.d.git ~/.emacs.d

Then just start your emacs editor, which will auto download required packages and build them.

# Features
* Use GTAGS to view source code, which support kinds of languages
* Auto complete source code
* Helm frame support
* Work session restore
* Dictionary support
* Lots of theme to select

# Usage
## View kinds of source code
1. Install dependent packages for generate GTAGS for kinds of languages
```bash
$ yaourt -Ss global ctags pygmentize
```
2. Enter your project directory and generate GTAGS use `ctags` or `pygments`
```bash
$ gtags --gtagslabel=ctags --debug			# use ctags
$ gtags gtags --gtagslabel=pygments --debug	# use pygments
```
3. View source code in Emacs through [helm-gtags](https://github.com/syohex/emacs-helm-gtags)

| Command|Action|
|:-----------|:------|
|C-c g a|Show tag names which are referenced in this function and jump to them.|
|C-j|Tag jump using gtags and helm|
|M-t|Input tag name and move to the definition|
|M-r|Input tag name and move to the referenced point|
|M-s|Input symbol and move to the locations|
|M-.|Find name by context|
|M-,|Move to previous point on the stack|
|C-c <|Move to previous history on the context stack|
|C-c >|Move to next history on context stack|


## Complete source code
Use [company-mode](https://github.com/company-mode/company-mode) to complete kinds of languages
* C/C++: use [irony-mode](https://github.com/Sarcasm/irony-mode) and [company-irony](https://github.com/Sarcasm/company-irony)
* Ruby: use [robe](https://github.com/dgutov/robe)
* Python: [jedi](https://github.com/davidhalter/jedi)
* Latex: [auctex](https://www.gnu.org/software/auctex/) and [company-auctex](https://github.com/alexeyr/company-auctex)
* Emacs Lisp & others: company-mode backends

## Helm frame
Use Helm frame by default, which will make enter command more easily.
* Bind the traditional C-x C-f to helm-find-files by default. You should use C-l to go to the precedent directory level instead of DEL
* Bind M-x to helm-M-x
I'm go on learning it, see [emacs-helm](https://github.com/emacs-helm/helm) for more details.

## Work session restore
This is a convenient function which will save your last work session and restore them when you next start emacs.
If you want to cancel this, just comment `(require 'init-session')` line in *~/.emacs.d/init.el*.

## Dictionary support
This is a useful function when you want to search some words in emacs.

1. To enable this feature, you should install *dictd*.
```bash
$ yaourt -S dictd
# Then download some dictionaries and edit '/etc/dict/dictd.conf' to index them
$ systemctl start dictd.service # start dictd service
$ systemctl enable dictd.service # if you want to start this serive when boot
```
2. Search words in emacs, use [dictionary](http://me.in-berlin.de/~myrkr/dictionary/index.html) package
* Search word definition: C-c d
* Enter word to search: C-c s
* Dictionary match words: C-c m

## Select theme you like
Lots of theme will be installed when first start emacs, you can chose one you like.
See this [gallery](http://pawelbx.github.io/emacs-theme-gallery/):

* monokai-theme
* color-theme-sanityinc-tomorrow
* cherry-blossom-theme
* busybee-theme
* gruber-darker-theme
* afternoon-theme
* cyberpunk-theme
* moe-theme
* alect-themes
* ample-theme

Use `M-x load-theme`, then chose one and try.

## Other misc packages
* [window-numbering-mode](https://github.com/nschum/window-numbering.el): use `M-[0-9]` to quick change window
* [smart-compile](https://github.com/sroccaserra/emacs/blob/master/smart-compile.el): use `smart-compile` to compile c\c++ code
* [w3m](https://github.com/doitian/emacs-w3m) view web pages: it's simple configure file can be found in *~/.emacs.d/lisp/init-w3m.el*

# Configuration file structure

File in '.emacs.d/init.el' bootstraps the configuration.  
Other config files are placed in 'lisp/init-*.el', and required packages will be downloaded at first boot.
