# PHP für Docker

## Einstellungen

### Sessions

Die Sessions von PHP werden standardmässig im Memcached gespeichert, um die Sessiondaten über mehrere Instanzen auf
verschiedenen Hosts verwenden zu können. Auch bleiben die Sessiondaten bei einem Neustart des Containers zu erhalten.

Es muss ein Host ``memcache`` im Stack verfügbar sein. Hier kann z.B. ``foobox/memcached`` verwendet werden.


## Umgebungsvariablen

Folgende Umgebungsvariblen können beim Starten des Containers übergeben werden, damit diese Einstellungen von PHP
übernommen werden.

Sollte ein bestimmter Bereich (wie Admin) der Seite ein höheres Limit benötigen, so sollte zuerst versucht werden einen
weiteren Container mit einem höheren Limit zu starten, der nur für diesen Bereich zuständig ist. Hierfür muss der Pfad
mit den höheren Anforderungen im Loadbalancer auf den weiteren Container zeigen.

### PHP_TIME_LIMIT

Die maximale Laufzeit eines PHP-Scripts in Sekunden, falls dieses über foobox/php:7.1-apache oder foobox/php:7.1-fpm
gestartet wurde. Unter foobox/php:7.1-cli, dass für Cronjobs verwendet werden kann wird dieses Limit ignoriert.

Standardwert: 10

### PHP_MEMORY_LIMIT

Die maximaler Speicherverbrauch eines PHP-Scripts, falls dieses über foobox/php:7.1-apache oder foobox/php:7.1-fpm
gestartet wurde. Unter foobox/php:7.1-cli, dass für Cronjobs verwendet werden kann wird dieses Limit ignoriert.

Standardwert: 64M


## Images

### foobox/php:7.1-common

Dieses Image wird von allen PHP-Images verwendet um eine gemeinsame Basis für oft benutzte Einstellungen und
Erweiterungen bereitzustellen. Die php.ini wurde unter /etc/php7/conf.d in mehrere kleine Konfigurationsdateien in
aufgeteilt um Änderungen zu erleichtern.

### foobox/php:7.1-apache

``foobox/php:7.1-apache`` enthält einen Apache 2.4 als Webserver und PHP 7.1 als Modul um Anwendungen auszuführen.

Dieses Image enthält ONBUILD-Anweisungen in der Dockerfile, damit das aktuelle Verzeichnis in das nächste Image kopiert
wird und falls eine Datei ``/var/www/html/composer.json`` existiert, werden die benötigten PHP-Erweiterungen automatisch
per ``apk`` installiert.

### foobox/php:7.1-cli

``foobox/php:7.1-cli`` kann für Cronjobs verwendet werden.

### foobox/php:7.1-cli-dev

``foobox/php:7.1-cli-dev`` ist eine Erweiterung zu ``foobox/php:7.1-cli`` und enthält ``composer`` und ``phpunit`` die im
Deployment für das Installieren von Abhängigkeiten und für Unittests verwendet werden können.
