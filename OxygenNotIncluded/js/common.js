// ページ共通でロードする処理
(function(){
    // ページタイトル
    var title = document.createElement("title");
    title.innerText = "ゲームプレイメモ - Oxygen Not Included";
    document.head.appendChild(title);

    [ // 読み込む js ファイルリスト
        "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js",
        "http://code.jquery.com/jquery-1.11.1.min.js",
        "http://code.jquery.com/ui/1.11.2/jquery-ui.min.js",
        "/OxygenNotIncluded/js/File.js"
    ].forEach(function (file, i) {
        var script = document.createElement("script");
        script.src = file;
        document.head.appendChild(script);
    });
    [ // 読み込む css ファイルリスト
        "/css/index.css",
        "/OxygenNotIncluded/css/index.css",
        "http://code.jquery.com/ui/1.11.2/themes/cupertino/jquery-ui.css"
    ].forEach(function (file, i) {
        var link = document.createElement("link");
        link.rel = "stylesheet";
        link.type = "text/css";
        link.href = file;
        document.head.appendChild(link);
    });
})();
