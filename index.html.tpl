<html>
    <body>
        <h1>JScoobyCed .deb packages repository</h1>
        <h2>How to add this repository</h2>
        On a terminal run the following commands:
        <br />
        <pre>
wget -qO - https://jscoobyced.github.io/repo/KEY.gpg | sudo apt-key --keyring /etc/apt/trusted.gpg.d/jscoobyced-deb.gpg add -
echo "deb https://jscoobyced.github.io/repo/ ./" | sudo tee /etc/apt/sources.list.d/jscoobyced-dev.list
sudo apt update
        </pre>
        <br />You might need to delete old key and repository first.
<pre>
sudo rm /etc/apt/sources.list.d/jscoobyced-dev.list
sudo rm /etc/apt/trusted.gpg.d/jscoobyced-deb.gpg
</pre>
        <h2>List of packages:</h2>
        <table>
