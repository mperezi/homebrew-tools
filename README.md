## The Homebrew Developer Guide

### 🧪 New formulae

First create a new tap

```bash
$ brew tap-new mperezi/tools
$ brew --repo mperezi/tools
/usr/local/Homebrew/Library/Taps/mperezi/homebrew-tools
```

Create a new formula for this tap with the URL of your zip or tarball

```bash
$ brew create \
	--tap=mperezi/tools \
	https://github.com/mperezi/hadolint-wrapper/releases/download/v1.2/hadolintw-1.2.0-brew.tar.gz
```

Edit the formula and validate it before submitting

```bash
$ brew audit --new-formula mperezi/tools/hadolint-wrapper
```

Go to [GitHub](https://github.com/) and create the repository with the name of the tap ([*mperezi/homebrew-tools*](https://github.com/mperezi/homebrew-tools/)).

Finally submit your formula

```bash
$ cd $(brew --repo mperezi/tools)
# Set up Git
$ git init
$ git add Formula
$ git commit -m "Add hadolint-wrapper formula"
# Set up the remote
$ git remote add origin https://github.com/mperezi/homebrew-tools
$ git push -u origin master
```

### 🍾 Bottles

[Brew bottles](https://docs.brew.sh/Bottles) are precompiled versions of formulae. They provide a better user experience by speeding things up when your software takes a long time to compile.

#### Bintray setup

Homebrew uses [Bintray](https://bintray.com/) to distribute its own binaries.

1. [Sign up for an Open Source Bintray account](https://bintray.com/signup/oss). Use the same username as your GitHub account ([*mperezi*](https://bintray.com/mperezi)).

2. Create a new repository for your bottles. Name it like your tap ([*mperezi/bottles-tools*](https://bintray.com/mperezi/bottles-tools)).
3. Add a new package in your repository with the same name of the formula you're building a bottle for ([*mperezi/bottles-tools/hadolint-wrapper*](https://bintray.com/mperezi/bottles-tools/hadolint-wrapper)).

#### macOS setup

1. Create the bottle using the [Homebrew Test Bot](https://github.com/Homebrew/homebrew-test-bot/):

```bash
$ brew test-bot \
	--root-url=https://dl.bintray.com/mperezi/bottles-tools \
	--bintray-org=mperezi \
	--tap=mperezi/tools \
	--skip-setup \
	--keep-old \
	mperezi/tools/hadolint-wrapper
```

The `test-bot` command above will create several files related to the formula you are building: 

* `hadolint-wrapper--1.2.0.catalina.bottle.tar.gz`
* `hadolint-wrapper--1.2.0.catalina.bottle.json`

2. Upload the bottle to your Bintray repository:

```bash
$ export HOMEBREW_BINTRAY_USER=...
$ export HOMEBREW_BINTRAY_KEY=...
$ brew test-bot \
	--ci-upload \
	--git-name=mperezi \
	--git-email=mperezibars@gmail.com \
	--bintray-org=mperezi \
	--root-url=https://dl.bintray.com/mperezi/bottles-tools
```

The `HOMEBREW_BINTRAY_KEY` environment variable must be set to the access token of your Bintray account. This can be found by clicking *[Edit Profile](https://bintray.com/profile/edit) -> API Key* when you are logged in to Bintray.

3. Once the upload is finished, visit the [_Files_](https://bintray.com/mperezi/bottles-tools/hadolint-wrapper#files) section of your package and hit “Publish”.

   ![Bintray unpublished package notice banner](https://jonathanchang.org/uploads/2019/homebrew/3-bintray-publish.png)

4. Now, from your tap repository, run `git show` to ensure that the `bottle do` block looks correct, then `git push` so your users will see the new bottles.

## References

* https://jonathanchang.org/blog/maintain-your-own-homebrew-repository-with-binary-bottles/