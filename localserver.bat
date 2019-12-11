@echo off
@rem �T�C�g���[�g�p�X���g�p�����y�[�W�����[�J�����ł������悤�ɂ���o�b�`�X�N���v�g
@rem Usage:
@rem   localserver.bat [�|�[�g�ԍ�]
@rem     [�|�[�g�ԍ�] : (�C��)�f�t�H���g�� 8000
@rem ���̃o�b�`�t�@�C�������s����ƁA�J�����g�f�B���N�g�������[�g�Ƃ���
@rem ���[�J���T�[�o�[�����B
@rem �u���E�U�ɂĉ��L URL ���J�����ƂŃy�[�W���v���r���[�ł���悤�ɂȂ�B
@rem   http://localhost:{�|�[�g�ԍ�}
@rem �I�i�|�[�g�j�����ꍇ�̓R�}���h�v�����v�g��� Ctrl+C �L�[�������B
@rem �����̃o�b�`�t�@�C���� python ���g�p����̂ŃC���X�g�[�����Ă������ƁB
@rem   python �� 2�n 3�n�����ɑΉ����Ă���B
@rem �Q�l URL: https://qiita.com/higuma/items/b23ca9d96dac49999ab9
echo ================================================================
echo = �u���E�U�ɂ� http://localhost:{�|�[�g�ԍ�} �ɃA�N�Z�X�ł���悤�ɂȂ�܂��B
echo = Ctrl+C �� y ���͂ŏI���ł��܂��B
echo = �����̃o�b�`�t�@�C���� python ���C���X�g�[�����ꂽ���Ŏ��s���Ă��������B
echo ================================================================
echo �ȍ~���s���O ...
echo.
setlocal enabledelayedexpansion

rem ������ϐ��ɓ���Ă���
set PORT=%~1

rem python �R�}���h�� 2�n�� 3�n�� ���C���X�g�[�������f���ĎI�N��
rem - Python 2�n�̏ꍇ
python --version | find "Python 2" >NUL
if not errorlevel 1 goto :OnPython2
rem - Python 3�n�̏ꍇ
python --version | find "Python 3" >NUL
if not errorlevel 1 goto :OnPython3
rem Python ���C���X�g�[������Ă��Ȃ��ꍇ
echo ���萔�ł����Apython ���C���X�g�[�����Ă�����s���Ă��������B
exit /b 1

:OnPython2
    rem Python 2�n�̏ꍇ�̃R�}���h�����s
    python -m SimpleHTTPServer %PORT%
    exit /b 0

:OnPython3
    rem Python 2�n�̏ꍇ�̃R�}���h�����s
    python -m http.server %PORT%
    exit /b 0