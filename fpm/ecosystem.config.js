module.exports = {
    apps : [{
        cwd       : '/var/www/',
        name      : 'php-fpm',
        script    : '/home/linuxbrew/.linuxbrew/opt/php72/sbin/php-fpm',
        args      : '--nodaemonize --fpm-config /home/linuxbrew/.linuxbrew/etc/php/7.2/php-fpm.conf',
        exec_interpreter: 'none',
        exec_mode: 'fork_mode',
        error_file : "/dev/stderr",
        out_file : "/dev/stdout"
    }]
};