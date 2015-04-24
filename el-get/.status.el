((anzu status "installed" recipe
       (:name anzu :website "https://github.com/syohex/emacs-anzu" :description "A minor mode which displays current match and total matches." :type "github" :branch "master" :pkgname "syohex/emacs-anzu"))
 (clean-aindent status "installed" recipe
		(:name clean-aindent :description "Emacs extension for clean auto-indent and backspace unindent" :type github :pkgname "pmarinov/clean-aindent"))
 (comment-dwim-2 status "installed" recipe
		 (:name comment-dwim-2 :description "An all-in-one comment command to rule them all." :type github :pkgname "remyferre/comment-dwim-2"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (dtrt-indent status "installed" recipe
	      (:name dtrt-indent :description "A minor mode that guesses the indentation offset originally used for creating source code files and transparently adjusts the corresponding settings in Emacs." :type github :pkgname "jscheid/dtrt-indent" :features
		     (dtrt-indent)
		     :post-init
		     (dtrt-indent-mode 1)))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:features el-get :post-init
		(when
		    (memq 'el-get
			  (bound-and-true-p package-activated-list))
		  (message "Deleting melpa bootstrap el-get")
		  (unless package--initialized
		    (package-initialize t))
		  (when
		      (package-installed-p 'el-get)
		    (let
			((feats
			  (delete-dups
			   (el-get-package-features
			    (el-get-elpa-package-directory 'el-get)))))
		      (el-get-elpa-delete-package 'el-get)
		      (dolist
			  (feat feats)
			(unload-feature feat t))))
		  (require 'el-get))))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :autoloads "helm-autoloads" :build
	      ("make")
	      :build/darwin
	      `(("make" ,(format "EMACS_COMMAND=%s" el-get-emacs)))
	      :build/windows-nt
	      (let
		  ((generated-autoload-file
		    (expand-file-name "helm-autoloads.el"))
		   \
		   (backup-inhibited t))
	      (update-directory-autoloads default-directory)
	      nil)))
(helm-swoop status "installed" recipe
(:name helm-swoop :type github :description "Efficiently hopping squeezed lines powered by Emacs helm interface" :pkgname "ShingoFukuyama/helm-swoop" :depends
(helm)))
(smartparens status "installed" recipe
(:name smartparens :description "Autoinsert pairs of defined brackets and wrap regions" :type github :pkgname "Fuco1/smartparens" :depends dash))
(undo-tree status "installed" recipe
(:name undo-tree :description "Treat undo history as a tree" :website "http://www.dr-qubit.org/emacs.php" :type git :url "http://www.dr-qubit.org/git/undo-tree.git/"))
(volatile-highlights status "installed" recipe
(:name volatile-highlights :description "Minor mode for visual feedback on some operations in Emacs" :type github :pkgname "k-talo/volatile-highlights.el" :features volatile-highlights))
(window-numbering status "installed" recipe
(:name window-numbering :website "http://nschum.de/src/emacs/window-numbering-mode/" :description "Assigns numbers to Emacs windows to allow easy window navigation." :type github :pkgname "nschum/window-numbering.el"))
(ws-butler status "installed" recipe
(:name ws-butler :description "Unobtrusively trim extraneous white-space *ONLY* in lines edited.\n" :type github :pkgname "lewang/ws-butler"))
(yasnippet status "installed" recipe
(:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
(("git" "submodule" "update" "--init" "--" "snippets")))))
