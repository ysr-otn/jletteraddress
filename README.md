jletteraddress.cls
==================

日本のはがきの宛名面のための，LaTeXのドキュメントクラスです．

LaTeXを使用して，日本のはがきの宛名面を作成することができます．
dvipdfmxを使っているなら，宛名はPDFのしおりに一覧表示することができます．

![BDF bookmark](pdfbookmark.png)


オリジナルの [jletteraddress](https://github.com/ueokande/jletteraddress) に対して
下記の変更を加えています．

- 明朝体，旧字体を使用できるようにパッケージを追加
- メインのフォントをボールド明朝に変更
- 差出人，受取人を連名とできる機能を追加
- 2024 年のインクジェット用年賀状に合せてフォーマットを変更


Usage
-----

まず，ドキュメントクラスを，TeXドキュメントの先頭に記述します．

``` tex
\documentclass[]{jletteraddress}
```

次に，差出人の名前，連名の差出人の名前，郵便番号，住所を，プリアンブルに記述します．

``` tex
\sendername{送り主 太郎}                   % Sender's name
\sendernameb{　　　 花子}                  % Sub sender's name
\senderaddressa{東京都千代田区1-2-3}       % Sender's address 1
\senderaddressb{送り主マンション 九九九}   % Sender's address 2
\senderpostcode{9999999}                   % Sender's postcode
```

連名の差出人が不在の場合はダミーとして全角スペースの名前を入れてください．

``` tex
\sendername{送り主 太郎}                   % Sender's name
\sendernameb{　　　 　　}                  % Sub sender's name
\senderaddressa{東京都千代田区1-2-3}       % Sender's address 1
\senderaddressb{送り主マンション 九九九}   % Sender's address 2
\senderpostcode{9999999}                   % Sender's postcode
```


これで．ドキュメントに受取人の情報を追加することができます．
受取人を追加するには，`\addaddress`マクロを使用して，送り主の名前，郵便番号，そ
して住所を，`\begin{document}`と`\end{document}`の間に指定します．
ただし連名者は必ず記載する必要があります．

``` tex
\begin{document}
  \addaddress
      {名前}{敬称}
      {連名者名前}{敬称}
      {郵便番号}
      {住所1}
      {住所2}
\end{document}
```

連名者が不在の場合はダミーとして全角スペースの名前と，空白の敬称を入れててください．
``` tex
\begin{document}
  \addaddress
      {名前}{敬称}
      {　　}{}
      {郵便番号}
      {住所1}
      {住所2}
\end{document}
```


使用例は，example.texを参照してください．


Licence
-------

MIT
