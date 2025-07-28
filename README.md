# STFC Cloud Azimuth Platform - User Docs
[![deploy-pages](https://github.com/stfc/azimuth-user-docs/actions/workflows/deploy-pages.yml/badge.svg)](https://github.com/stfc/azimuth-user-docs/actions/workflows/deploy-pages.yml)
[![Docs](https://img.shields.io/badge/docs-live-blue.svg)](https://stfc.github.io/azimuth-user-docs/)
![GitHub last commit](https://img.shields.io/github/last-commit/stfc/azimuth-user-docs)

These are the user docs for STFC Cloud's Azimuth deployment. They provide information for users specific to our deployment.

Azimuth is a self-service portal for managing cloud resources with a particular focus on simplifying the use of cloud for scientific computing, high-performance computing (HPC) and artificial intelligence (AI). [Learn more...](https://stfc.github.io/azimuth-user-docs/)

Unlike most STFC Cloud user docs which are on Confluence, these are maintained on Github Pages, built with MKDocs via GitHub actions:
- They are a fork, this lets us maintain parity, allowing us in future to pull upstream changes
- They are self-contained, for linking to from Azimuth
- They use features (code block annotations, in-sentence images, in-page ToC, font-awesome icons, custom svg emojis) that aren't present in confluence

# Attribution
These docs have been forked from [the generic Azimuth user docs](https://azimuth-cloud.github.io/azimuth-user-docs/). At the time of writing, these are incomplete and reference obsoleted features and deployment methods like Kubeapps, so have been majority rewritten.

The [Apache License 2.0](LICENSE.md) has been maintained.

# Contribution
Contributions are welcomed via pull request.

# Local Development
These docs are produced with [mkdocs-material](https://squidfunk.github.io/mkdocs-material/)

To get started, after making an environment (venv/conda etc), a `requirements.txt` file has been provided for easy local setup.

I.e., for conda:
``` sh
conda create -n mkdocs
conda activate mkdocs
pip install -r requirements.txt --upgrade
```

Docs can then be served locally and will update live:

``` sh
mkdocs serve
```

A link to the docs will be shown, but it defaults to `http://127.0.0.1:8000`

- Docs configuration (plugins, navigation, theme) is done in [mkdocs.yml](mkdocs.yml).
- Doc pages are in [./docs/](./docs/)
- Images and custom icons are stored in [./docs/assets](./docs/assets/)
- The build process is configured in [./.github/workflows
/deploy-pages.yml](./.github/workflows/deploy-pages.yml)
