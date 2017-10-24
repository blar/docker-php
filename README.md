# PHP für Docker

## Befehle

### composer-extension-install

Prüft ob eine Datei ``/var/www/html/composer.json`` existiert und installiert benötigte PHP-Erweiterungen per ``apk``.

### php-syntax-check

Geht ein Verzeichnis rekursiv durch und prüft die darin enthaltenen PHP-Dateien auf korrekten Syntax.

### apache2-module-enable

Aktiviert ein Modul, dass sich in /etc/apache2/modules-available befindet. Ist im Image foobox/php:7.1-apache verfügbar.

### apache2-module-disable

Deaktiviert ein Modul, dass sich in /etc/apache2/modules-enable befindet. Ist im Image foobox/php:7.1-apache verfügbar.


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

### PHP_POST_SIZE_LIMIT

Maximale Grösse des Post-Requests.

Standardwert: 8M

### PHP_UPLOAD_SIZE_LIMIT

Maximale Grösse einer Datei in einem Post-Request.

Standardwert: 8M

### PHP_XDEBUG_REMOTE_HOST

Host zu dem sich xdebug verbinden soll. Da die IP des Hostsystems evtl. nicht direkt direkt verfügbar ist, kann eine
Umgebungsvariable auf dem Hostsystem per ``PHP_XDEBUG_REMOTE_HOST`` z.B. in der Datei ``~/.bashrc`` definiert werden und
dem Container ``foobox/php:7.1-apache-dev`` beim Starten übergeben werden, damit xdebug sich zum gewünschten Host
verbinden kann.

Der Standardwert ``localhost`` könnte nur funktionieren, falls der Container mit ``--net=host`` gestartet wurde.

Standardwert: localhost

### PHP_XDEBUG_REMOTE_PORT

Wird von ``foobox/php:7.1-apache-dev`` verwendet.

Standardwert: 9000

### PHP_XDEBUG_PROFILE_PATH

Der Pfad unter dem die Ergebnisse des Profilers gespeichert werden sollen. Der Profiler kann über die GET oder POST-Variable
``XDEBUG_PROFILE`` aktiviert werden. Diese Dateien können sehr viel Speicherplatz benötigen und sollten regelmässig
gelöscht werden, falls diese nicht mehr benötigt werden.

https://xdebug.org/docs/profiler

Wird von ``foobox/php:7.1-apache-dev`` verwendet.

Standardwert: /tmp


### APPLICATION_ENV

Sollte die Umgebungsvariable APPLICATION_ENV nicht den Wert ``production`` haben, so wird per ``mod_alias`` unter
``/robots.txt`` verfügbar sein, die alle Suchmaschinenzugriffe verbietet. Zusätzlich wird per ``mod_headers`` ein Header
``X-Robots-Tag``  mit dem Wert ``noindex, nofollow, noarchive, nosnippet, noodp, noimageindex`` gesetzt. Auch werden die
Cachezeiten per ``mod_expires`` auf maximal eine Minute gesetzt damit Änderungen während der Entwicklung schneller
sichtbar werden.

Diese Einstellung wird aktuell nur von foobox/php:7.1-apache verwendet.


## Images

### foobox/php:7.1-common

Dieses Image wird von allen PHP-Images verwendet um eine gemeinsame Basis für oft benutzte Einstellungen und
Erweiterungen bereitzustellen. Die php.ini wurde unter /etc/php7/conf.d in mehrere kleine Konfigurationsdateien in
aufgeteilt um Änderungen zu erleichtern.

### foobox/php:7.1-apache

``foobox/php:7.1-apache`` enthält einen Apache 2.4 als Webserver und PHP 7.1 als Modul um Anwendungen auszuführen.

### foobox/php:7.1-apache-dev

``foobox/php:7.1-apache-dev`` ist eine Erweiterung zu ``foobox/php:7.1-apache`` und enthält ``xdebug``. In der
[Dokumentation von xdebug zum Debugging](https://xdebug.org/docs/remote) gibt es auch eine Liste von
Browsererweiterungen mit denen das Remote-Debugging aktiviert werden kann, damit sich PHP z.B. zu PHPStorm verbindet.

### foobox/php:7.1-cli

``foobox/php:7.1-cli`` kann für Cronjobs verwendet werden.

### foobox/php:7.1-cli-dev

``foobox/php:7.1-cli-dev`` ist eine Erweiterung zu ``foobox/php:7.1-cli`` und enthält ``composer`` und ``phpunit`` die im
Deployment für das Installieren von Abhängigkeiten und für Unittests verwendet werden können.
