Automated Dosbox-Staging Debian Build
This repository contains the necessary files to automatically build and package the latest version of Dosbox-Staging into a Debian (.deb) file using GitHub Actions. This workflow ensures that you always have a fresh, reproducible build environment and an up-to-date package.

How It Works
The entire process is automated through a CI/CD pipeline defined in a GitHub Actions workflow. The core components are:

Dockerfile: This file defines a Docker container that provides a clean, consistent, and reproducible Debian environment. It installs all the required build dependencies for Dosbox-Staging, ensuring that the build process works every time, regardless of the host machine.

build.sh: This is the main script that runs inside the Docker container. It handles the specific steps for compiling the Dosbox-Staging source code using CMake and Ninja, and then uses CPack to create the final .deb package.

.github/workflows/build-dosbox.yml: This is the GitHub Actions workflow file that orchestrates the entire process. It checks out the latest source code from the Dosbox-Staging repository, builds the Docker image, and executes the build.sh script inside the container.

Getting Started
To use this automation in your own repository, follow these simple steps:

Clone this repository to your local machine.

Copy the files:

Place the Dockerfile and build.sh files in the root directory of your repository.

Create a folder named .github/workflows in your repository root and place the build-dosbox.yml file inside it.

Commit and push the new files to your GitHub repository.

Running the Workflow
The pipeline is configured to run automatically under the following conditions:

On every push to the main branch.

On every pull request targeting the main branch.

Manually, via the "Run workflow" button in the "Actions" tab of your GitHub repository.

Retrieving the Package
Once the workflow has completed successfully, the generated .deb package will be saved as a workflow artifact. You can download it from the GitHub Actions interface:

Navigate to the "Actions" tab in your repository.

Click on the most recent workflow run for "Build Dosbox-Staging DEB Package".

In the job summary, look for the "Artifacts" section and download the dosbox-staging-deb-package. The .deb file will be inside the downloaded ZIP archive.

Feel free to customize the build.sh or the workflow file to meet your specific needs!