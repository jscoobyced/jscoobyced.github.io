<html>
    <body>
        <h1>JScoobyCed .deb packages repository</h1>
        <h2>How to add this repository</h2>
        On a terminal run the following commands:
        <br />
        <pre>
wget -qO - https://jscoobyced.github.io/KEY.gpg | sudo apt-key --keyring /etc/apt/trusted.gpg.d/jscoobyced-deb.gpg add -
echo "deb https://jscoobyced.github.io/ ./" | sudo tee -a /etc/apt/sources.list.d/additional-repositories.list
sudo apt update
        </pre>
        <br />You might need to delete old key and repository first. Check <a href='https://jscoobyced.github.io' target='_blank'>here</a> for more details.
        <h2>List of packages:</h2>
        <table>
