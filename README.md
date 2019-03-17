# Création de votre propre T.R.A.S.H. utilisant un Raspberry Pi

Bien qu'il est possible de rouler T.R.A.S.H. à partir de votre ordinateur personnel, nous avons choisi d'utiliser un Raspberry Pi pour sa facilité d'installation et de maintenance.

## Table des matières

1. [Installation de Rapsbian](#1-installation-de-raspbian)
2. [Installation du serveur de caméra](#1-installation-de-raspbian)
3. [Installation de T.R.A.S.H.](#1-installation-de-raspbian)
4. [Installation de Firmata sur le Arduino](#1-installation-de-raspbian)
5. [Assemblage des composants](#1-installation-de-raspbian)

## 1. Installation de Rapsbian

1. Télécharger la dernière version de [Raspbian Stretch with desktop and recommended software](https://www.raspberrypi.org/downloads/raspbian/)

2. Télécharger et installer [BalenaEtcher](https://www.balena.io/etcher/)

3. Insérez la carte microSd dans le lecteur de votre ordinateur

4. Lancez BalenaEtcher

5. Sélectionnez l'image téléchargée et décompressée de l'étape 1 (le fichier .zip)

![Sélectionner l'image disque dans BalenaEtcher](docs/balena-select-image.png)

6. Sélectionnez la carte microSD

![Sélectionner la carte SD dans BalenaEtcher](docs/balena-select-drive.png)

7. Cliquez sur Flash!

8. Insérez la carte microSD dans le Raspberry Pi, branchez-y clavier/souris/écran et branchez l'alimentation.

9. Suivez les étapes de cofiguration du Raspberry Pi qui apparaissent au premier démarage (langage, WiFi, etc.)

## Installation du serveur de caméra pour T.R.A.S.H.

Nous avons besoin d'une caméra accessible via HTTP pour que T.R.A.S.H. reconnaisse les Shiny à attraper. Nous alons utiliser Motion.

1. Ouvrez le terminal et tapez les commandes suivantes et tapez `y` lorsque demandé:

```
sudo apt-get update
sudo apt-get install -y motion
```

2. Une fois installé avec succès, nous alons configurer Motion. Entrez la commandes suivante pour éditer la configuration:

```
sudo nano /etc/motion/motion.conf
```

3. Trouvez la ligne `daemon off` et changez-la pour `daemon on`

4. Trouvez la ligne `stream_localhost on` et changez-la pour `stream_localhost off`

5. Enregistrez et quittez Nano (CTRL + X)

6. On a un autre ficher à configurer pour que Motion démarre en même temps que le Raspberry Pi :

```
sudo nano /etc/default/motion
```

7. et changez la ligne `start_motion_deamon=no` pour `start_motion_deamon=yes`, puis sauvegardez et quittez.

8. Branchez votre webcam

9. Démarrez le serveur de caméra avec:

```
sudo service motion start
```

9. Vérifiez que le tout foncitonne en lançant dans votre navigateur [http://localhost:8080]. Vous devriez voir l'image de la caméra

## Installation de T.R.A.S.H.

On va devoir installer des outils pour le langage de programmation Ruby, qui va rendre la gestion du projet plus facile

1. On installe les dépendances du projet

```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install -y ruby-dev autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev imagemagick libmagickwand-dev nginx yarn
```

2. On clone le projet:

```
git clone https://github.com/sophiedeziel/robo-catcher.git

cd robo-catcher
sudo bin/setup
```

3. Redémarez le Raspberry Pi

4. Accédez à l'interface à partir de n'importe quel ordinateur avec http://trash.local:3000/

## Installation de Firmata sur le Arduino

> À venir

## Assemblage des composants

> À venir
