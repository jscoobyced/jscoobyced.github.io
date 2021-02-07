<html>
    <body>
        <h1>JScoobyCed .deb packages repository</h1>
        <h2>How to add this repository</h2>
        On a terminal run the following commands:
<pre>
wget -qO - https://jscoobyced.github.io/repo/KEY.gpg | sudo apt-key --keyring /etc/apt/trusted.gpg.d/jscoobyced-deb.gpg add -
echo "deb https://jscoobyced.github.io/repo/ ./" | sudo tee /etc/apt/sources.list.d/jscoobyced-dev.list
sudo apt update
</pre>
        You might need to delete old key and repository first.
<pre>
sudo rm /etc/apt/sources.list.d/jscoobyced-dev.list
sudo rm /etc/apt/trusted.gpg.d/jscoobyced-deb.gpg
</pre>
If you get an error like
<pre>
The following signatures couldn't be verified because the public key is not available: NO_PUBKEY XXXXXXXXXXX
</pre>
you can resolve by doing this:
<pre>
gpg --export --armor XXXXXXXXXXX | sudo apt-key add -
</pre>

        <h2>List of packages:</h2>
        <table>
