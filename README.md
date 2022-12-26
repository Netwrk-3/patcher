## What is Patcher

Patcher is a Linux system maintenance and Security tool designed to make system maintenance tasks easier. Such as finding vulnebilities in the    Linux kernel verison you are currently using and patching them. Deleting useless files to free up disk space and more. It's a free and opensource tool published under the GNU GPL v3 license.

## Getting started
To get started with patcher you need to install it first. For that you need to choose a branch from which you're going to download the patcher executable.
We have three branches in our Github repository:
1. stable
2. beta

Download the latest stable releease [here](https://github.com/Emph-Inc/patcher/releases/download/0.1.33.2-stable/patcher).
Download the beta release [here](https://github.com/Netwrk-3/patcher/releases/download/beta-0.1.24/patcher).

## Installing Patcher
To install patcher you need yo choose if you want the latest stable release or the latest beta release. We recomend using the stable release for most people. 

Download the patcher executable from the links given above. Once you have your preffered release and downloaded the executeable, then cd into the directry where you have kept the downloaded executable and then run the following command. (You can also do the same by cloning into the Github repository).
```bash
# Clone into our Github repositoty via git
git clone https://github.com/Netwrk-3/patcher.git
# go into the cloned repo.
cd patcher
# Give the installer script executable permission
chmod +x ./install.bash
# Run the installation script with root privilages using sudo (same can be done using doas or pkexec)
sudo ./install.bash
```
## Check if patcher is installed properly
* on a debian based system:
![image](https://user-images.githubusercontent.com/104187311/165019626-4daaf15f-d47e-43c4-b7c9-c525498f0b3a.png)
---
* on a fedora based system:
![image](https://user-images.githubusercontent.com/104187311/165018722-46efa242-be14-433d-8d5d-d9e19bf3a718.png)
---
* on my system:
![image](https://user-images.githubusercontent.com/104187311/166226609-926a1d76-2558-4e75-8a5c-90490f8f6470.png)

## FAQs
<details>
<summary>How does the release cycle of patcher work ?</summary>
<br>
Patcher's release cycle has three main brachnes. The stable branch, the testing branch and the beta branch. The beta branch is where new feautres are added to patcher and they are worked on. The beta branch's code has some bugs which get's patched in the testing branch. In the testing the code from the beta branch gets edited to make if faster and more lightweight. We aslo try patcher on different architectures and also on different distros before releasing it to the stable brach. We recomend you to use the stable version of patcher to avoid errors and bugs.
<br><br>
<pre>
Question asked at 16:33 UTC 23 April 2022
</pre>
</details>

---

<details open>
<summary>How to contribute to patcher</summary>
<br>
You can contribute code to patcher from our github repository at https://github.com/Emph-Inc/patcher
<br><br>
<pre>
Question asked at 13:56 IST 22 April 2022
</pre>
</details>
