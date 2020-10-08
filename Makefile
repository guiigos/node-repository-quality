include .env

release:
	GITHUB_TOKEN=${GH_TOKEN} npx semantic-release --no-ci
