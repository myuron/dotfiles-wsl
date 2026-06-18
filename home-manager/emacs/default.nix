{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      leaf
      eglot # LSP
      eglot-booster #  LSP run faster
      go-mode # LSP for go
      nix-mode # LSP for nix
      corfu  # インライン補完の提供
      corfu-terminal # terminal mode でのポップアップ
      cape #  インライン補完の生成
      puni # parent補完
      flymake # コード診断機能
      which-key #  キーバインドの補完表示
      vertico # 補候補を縦に並べる
      marginalia # 補完候補について不随情報を追加する
      consult # 補完候補を生成する
      affe # 非同期で補完候補を生成する
      orderless # 順序違いの絞り込みスタイルの提供
      embark # 補完候補に対するアクションの提供
      magit # git client
      git-gutter # git 変更点の表示
      doom-themes # カラースキーマ
      doom-modeline # モードライン
      treemacs # ファイルツリー
      treemacs-nerd-icons # ファイルツリーのアイコン
    ];
    extraConfig = builtins.readFile ./init.el;
  };
}
