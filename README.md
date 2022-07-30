# 株式会社ゆめみ iOS エンジニアコードチェック課題

## 概要

本プロジェクトは株式会社ゆめみ（以下弊社）が、弊社に iOS エンジニアを希望する方に出す課題のベースプロジェクトです。本課題が与えられた方は、下記の概要を詳しく読んだ上で課題を取り組んでください。

## アプリ仕様

本アプリは GitHub のリポジトリーを検索するアプリです。

![動作イメージ](README_Images/app.mp4)

### 環境

- IDE：Xcode 13.4.1
- Swift：5.6.1
- 開発ターゲット：iOS 15.0
- 使用したライブラリ
    - Kingfisher https://github.com/onevcat/Kingfisher.git


### 動作

1. 何かしらのキーワードを入力
2. GitHub API（`search/repositories`）でリポジトリーを検索し、結果一覧を概要（リポジトリ名）で表示
3. 特定の結果を選択したら、該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue 数）を表示
4. ウェブで見るボタンをクリックすると、Safariでレポジトリの詳細を表示

### 悩み
今まできちんとGitを使った開発をしてこなかったので、Gitの仕様に色々悩まされた。たびたびコンフリクトが発生してしまったり、一度ファイルを全て削除してしまったりもした。

## 参考記事

### Kingfisherを使用する際に参考
-[【Kingfisher】画像の読み込み方法](https://utro-develop.com/xcode-imageview-kingfisher/)

### テスト設計をする際に参考
-[XCTest入門Part2 (Swift) ~非同期編~](https://qiita.com/y-okudera/items/e02b73880b8bc499debe)
-[XCTest入門 (Swift) ~UITest編~](https://qiita.com/y-okudera/items/b6211cc3524ad2385150)

### 参考文献
-『Swift実践入門（第3版）』
-『iPhoneアプリ開発集中講座』

