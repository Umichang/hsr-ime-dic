#
# このファイルは MITライセンスです。詳細はGithub上のリポジトリを参照してください。
# https://github.com/Umichang/hsr-ime-dic
#
# Microsoft IME形式の dic.txt からmacOS向けの dic.plist とGboard向けの dic.zip を生成します。
# 実行にはiconv、Rubyの実行環境と userdic-ng 1.0 以降が必要です。
# https://github.com/Umichang/userdic-ng
#

SOURCE = main.txt
TARGET = main.plist main.zip main.atok.txt

.SUFFIXES: .txt .plist .zip .atok.txt

all: ${TARGET}

.txt.plist:
	userdic-ng msime apple < $< > $@

.txt.zip:
	iconv -f UTF-16LE -t UTF-8 < $< > dictionary.txt; zip -u $@ dictionary.txt ; rm dictionary.txt

.txt.atok.txt:
	userdic-ng msime atok < $< | iconv -f UTF-16LE -t UTF-8 | ruby -pe 'gsub("ゔ", "ヴ")' | iconv -f UTF-8 -t MS_KANJI -c | ruby -pe 'sub("\n", "\r\n")' > $@

clean:
	rm ${TARGET}