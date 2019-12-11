@echo off
@rem サイトルートパスを使用したページをローカル環境でも見れるようにするバッチスクリプト
@rem Usage:
@rem   localserver.bat [ポート番号]
@rem     [ポート番号] : (任意)デフォルトは 8000
@rem このバッチファイルを実行すると、カレントディレクトリをルートとして
@rem ローカルサーバーが立つ。
@rem ブラウザにて下記 URL を開くことでページをプレビューできるようになる。
@rem   http://localhost:{ポート番号}
@rem 鯖（ポート）を閉じる場合はコマンドプロンプト上で Ctrl+C キーを押す。
@rem ※このバッチファイルは python を使用するのでインストールしておくこと。
@rem   python は 2系 3系両方に対応している。
@rem 参考 URL: https://qiita.com/higuma/items/b23ca9d96dac49999ab9
echo ================================================================
echo = ブラウザにて http://localhost:{ポート番号} にアクセスできるようになります。
echo = Ctrl+C 後 y 入力で終了できます。
echo = ※このバッチファイルは python がインストールされた環境で実行してください。
echo ================================================================
echo 以降実行ログ ...
echo.
setlocal enabledelayedexpansion

rem 引数を変数に入れておく
set PORT=%~1

rem python コマンドが 2系か 3系か 未インストールか判断して鯖起動
rem - Python 2系の場合
python --version | find "Python 2" >NUL
if not errorlevel 1 goto :OnPython2
rem - Python 3系の場合
python --version | find "Python 3" >NUL
if not errorlevel 1 goto :OnPython3
rem Python がインストールされていない場合
echo お手数ですが、python をインストールしてから実行してください。
exit /b 1

:OnPython2
    rem Python 2系の場合のコマンドを実行
    python -m SimpleHTTPServer %PORT%
    exit /b 0

:OnPython3
    rem Python 2系の場合のコマンドを実行
    python -m http.server %PORT%
    exit /b 0