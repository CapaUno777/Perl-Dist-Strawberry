### job description for building strawberry perl

#Available '<..>' macros:
# <package_url>   is placeholder for http://strawberryperl.com/package
# <dist_sharedir> is placeholder for Perl::Dist::Strawberry's distribution sharedir
# <image_dir>     is placeholder for c:\strawberry

{
  app_version     => '5.14.2.1', #BEWARE: do not use '.0.0' in the last two version digits
  bits            => 64,
  beta            => 0,
  app_fullname    => 'Strawberry Perl (64-bit)',
  app_simplename  => 'strawberry-perl',
  build_job_steps => [
    ### STEP 1 ###########################
    {
        plugin  => 'Perl::Dist::Strawberry::Step::BinaryToolsAndLibs',
        install_packages => {
            #tools
            'dmake'         => '<package_url>/kmx/64_tools/64bit_dmake-SVN20091127-bin_20111107.zip',
            'mingw-make'    => '<package_url>/kmx/64_tools/64bit_gmake-3.82-bin_20110503.zip',
            'pexports'      => '<package_url>/kmx/64_tools/64bit_pexports-0.44-bin_20100110.zip',
            'patch'         => '<package_url>/kmx/64_tools/64bit_patch-2.5.9-7-bin_20100110_UAC.zip',
            #gcc
            'gcc-toolchain' => { url=>'<package_url>/kmx/64_gcctoolchain/mingw64-w64-gcc4.4.7-pre_20111101.zip', install_to=>'c' },
            'gcc-license'   => '<package_url>/kmx/64_gcctoolchain/mingw64-w64-gcc4.4.7-pre_20111101-lic.zip',
            #libs
            'libdb'         => '<package_url>/kmx/64_libs/gcc44-2011/64bit_db-5.1.25-bin_20110506.zip',
            'libexpat'      => '<package_url>/kmx/64_libs/gcc44-2011/64bit_expat-2.0.1-sezero20110428-bin_20110506.zip',
            'freeglut'      => '<package_url>/kmx/64_libs/gcc44-2011/64bit_freeglut-2.6.0-bin_20110506.zip',
            'libfreetype'   => '<package_url>/kmx/64_libs/gcc44-2011/64bit_freetype-2.4.4-bin_20110506.zip',
            'libgd'         => '<package_url>/kmx/64_libs/gcc44-2011/64bit_gd-2.0.35(OLD-jpg-png)-bin_20110506.zip',
            'libgdbm'       => '<package_url>/kmx/64_libs/gcc44-2011/64bit_gdbm-1.8.3-bin_20110506.zip',
            'libgif'        => '<package_url>/kmx/64_libs/gcc44-2011/64bit_giflib-4.1.6-bin_20110506.zip',
            'gmp'           => '<package_url>/kmx/64_libs/gcc44-2011/64bit_gmp-5.0.1-bin_20110506.zip',
            'libjpeg'       => '<package_url>/kmx/64_libs/gcc44-2011/64bit_jpeg-8c-bin_20110506.zip',
            'libxpm'        => '<package_url>/kmx/64_libs/gcc44-2011/64bit_libXpm-3.5.9-bin_20110506.zip',
            'libiconv'      => '<package_url>/kmx/64_libs/gcc44-2011/64bit_libiconv-1.13.1-sezero20110428-bin_20110506.zip',
            'libpng'        => '<package_url>/kmx/64_libs/gcc44-2011/64bit_libpng-1.5.2-bin_20110506.zip',
            'libssh2'       => '<package_url>/kmx/64_libs/gcc44-2011/64bit_libssh2-1.2.8-bin_20110506.zip',
            'libxml2'       => '<package_url>/kmx/64_libs/gcc44-2011/64bit_libxml2-2.7.8-bin_20110506.zip',
            'libxslt'       => '<package_url>/kmx/64_libs/gcc44-2011/64bit_libxslt-1.1.26-bin_20110506.zip',
            'mpc'           => '<package_url>/kmx/64_libs/gcc44-2011/64bit_mpc-0.9-bin_20110506.zip',
            'mpfr'          => '<package_url>/kmx/64_libs/gcc44-2011/64bit_mpfr-3.0.1-bin_20110506.zip',
            'libmysql'      => '<package_url>/kmx/64_libs/gcc44-2011/64bit_mysql-5.1.44-bin_20100304.zip',
            'libopenssl'    => '<package_url>/kmx/64_libs/gcc44-2011/64bit_openssl-1.0.0d-bin_20110506.zip',
            'libpostgresql' => '<package_url>/kmx/64_libs/gcc44-2011/64bit_postgresql-9.0.4-bin_20110506.zip',
            'libtiff'       => '<package_url>/kmx/64_libs/gcc44-2011/64bit_tiff-3.9.5-bin_20110506.zip',
            'libxz'         => '<package_url>/kmx/64_libs/gcc44-2011/64bit_xz-5.0.2-bin_20110506.zip',
            'zlib'          => '<package_url>/kmx/64_libs/gcc44-2011/64bit_zlib-1.2.5-bin_20110506.zip',
        },
    },
    ### STEP 2 ###########################
    {
        plugin   => 'Perl::Dist::Strawberry::Step::InstallPerlCore',
        url      => 'http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/perl-5.14.2.tar.gz',
        cf_email => 'strawberry-perl@project',
        patch    => { #DST paths are relative to the perl src root
            '<dist_sharedir>/perl-5.14/win32_config.gc.tt'      => 'win32/config.gc',
            '<dist_sharedir>/perl-5.14/win32_config.gc64nox.tt' => 'win32/config.gc64nox',
            '<dist_sharedir>/perl-5.14/win32_config_H.gc'       => 'win32/config_H.gc',
            '<dist_sharedir>/perl-5.14/win32_config_H.gc64nox'  => 'win32/config_H.gc64nox',
            '<dist_sharedir>/perl-5.14/win32_FindExt.pm'        => 'win32/FindExt.pm',
            #'<dist_sharedir>/perl-5.14/win32_config_sh.PL'      => 'win32/config_sh.PL',
            '<dist_sharedir>/perl-5.14/NDBM_MSWin32.pl'         => 'ext/NDBM_File/hints/MSWin32.pl',
            '<dist_sharedir>/perl-5.14/ODBM_MSWin32.pl'         => 'ext/ODBM_File/hints/MSWin32.pl',
        },
        license => { #SRC paths are relative to the perl src root
            'Readme'   => '<image_dir>/licenses/perl/Readme',
            'Artistic' => '<image_dir>/licenses/perl/Artistic',
            'Copying'  => '<image_dir>/licenses/perl/Copying',
        },
    },
    ### STEP 3 ###########################
    {
        plugin => 'Perl::Dist::Strawberry::Step::InstallModules',
        modules => [ 
          { install_to=>'perl', module=>'http://strawberryperl.com/package/kmx/perl-modules-patched/Compress-Raw-Zlib-2.053_fixed_rt77030.tar.gz' },
        ],
    },
    {
        plugin => 'Perl::Dist::Strawberry::Step::UpgradeCpanModules',
        exceptions => [ # match: version distribution cpan_file
          #{ do=>'ignore_testfailure', distribution => 'HTTP-Tiny', version=>'0.018' },
          #{ do=>'skiptest',           distribution => qr/IPC-.*/ },
          { do=>'skip',               distribution => 'Compress-Raw-Zlib' },
          { do=>'ignore_testfailure', distribution => 'CPANPLUS' },
          { do=>'ignore_testfailure', distribution => 'IPC-Cmd' },
        ]
    },
    ### STEP 4 ###########################
    {
        plugin => 'Perl::Dist::Strawberry::Step::InstallModules',
        modules => [
            # term related
            #'http://search.cpan.org/CPAN/authors/id/S/ST/STSI/TermReadKey-2.30.02.tar.gz', # special version needed - on CPAN marked as ** UNAUTHORIZED RELEASE **
            'http://strawberryperl.com/package/kmx/perl-modules-patched/TermReadKey-2.30.02.tar.gz',
            #qw/ Term::ReadLine::Perl /, # XXX-TODO not sure about this, do not know how to make the installation non-interactive
            { module=>'Term::ReadLine::Perl', env=>{ PERL_MM_NONINTERACTIVE=>1 } },
        
            # compression
            qw/ Archive-Zip IO-Compress-Lzma Compress-unLZMA/,

            # file related
            { module=>'File-Slurp', ignore_testfailure=>1 }, #XXX-TODO: File-Slurp-9999.19 test FAILS
            qw/ File-Find-Rule          File-HomeDir            File-Listing            File-Remove
                File-ShareDir           File-Which              File-Copy-Recursive /,

            # database stuff
            qw/ DBI DBD-ODBC DBD-SQLite DBD-Pg DBIx-Simple /,
            { module=>'DBD-ADO', ignore_testfailure=>1 }, #XXX-TODO: DBD-ADO-2.99 test FAILS
            { 
              module => 'http://strawberryperl.com/package/kmx/perl-modules-patched/DBD-mysql-4.020_patched_h.tar.gz', 
              #the following does not work
              #module => 'http://strawberryperl.com/package/kmx/perl-modules-patched/DBD-mysql-4.020_patched.tar.gz', 
              #makefilepl_param => '--mysql_config=mysql_config',
            },
            #XXX FIXME - makefilepl_param does not work
            #perl z:\strawberry_build\BR_Perl-Dist-Strawberry\share\utils\CPANPLUS_install_module.pl -module http://strawberryperl.com/package/kmx/perl-modules-patched/DBD-mysql-4.020_patched.tar.gz -makefilepl_param "--mysql_config=mysql_config"

            # math related
            qw/ Math-BigInt-GMP Math-GMP Math-MPC Math-MPFR /, # Math-Pari does not build on 64bit

            # crypto
            'http://strawberryperl.com/package/kmx/perl-modules-patched/Crypt-IDEA-1.08_patched.tar.gz',
            'http://strawberryperl.com/package/kmx/perl-modules-patched/Crypt-Blowfish-2.12_patched.tar.gz',
            { module =>'Convert-PEM', ignore_testfailure=>1 }, #XXX-TODO: Convert-PEM-0.08 test FAILS
            
            #{ module =>'Crypt-OpenPGP' }, #XXX-TODO: needs Math::PARI (fails on 64bit)
            #{ module =>'Module-Signature', ignore_testfailure=>1 }, #XXX-TODO: Module-Signature needs Math::PARI (fails on 64bit)
            #XXX-TODO: Crypt::Random needs Math::Pari, Crypt::Primes needs Crypt::Random, Crypt::RSA needs Crypt::Random
            qw/ Crypt-Rijndael Crypt-Twofish Crypt-CAST5_PP Crypt-CBC Crypt-DES_EDE3 Crypt-DES Crypt-DSA Crypt-RIPEMD160 /,
            qw/ Class-Loader Convert-ASCII-Armor Sort-Versions Tie-EncryptedHash /,
            
            qw/ Crypt-DH /,
           
            # digests
            qw/ Digest-BubbleBabble Digest-HMAC Digest-MD2 Digest-SHA1 /,

            # SSL & SSH
            { module=>'Net-SSLeay', skiptest=>1 },
            qw/ Crypt-SSLeay Net-SSH2 IO-Socket-SSL Net-SMTP-TLS /,

            # network
            qw/ LWP::UserAgent LWP-Protocol-https /,

            # win32 related
            { module=>'Win32API-Registry', ignore_testfailure=>1 }, #XXX-TODO: Win32API-Registry-0.32 test FAILS
            { module=>'Win32-TieRegistry', ignore_testfailure=>1 }, #XXX-TODO: Win32-TieRegistry-0.26 test FAILS
            qw/ Win32-API               Win32-EventLog          Win32-Exe               Win32-OLE
                Win32-Process           Win32-WinError          Win32-File-Object       Win32-UTCFileTime /,

            # graphics
            'http://strawberryperl.com/package/kmx/perl-modules-patched/GD-2.46_patched.tar.gz',
            qw/ Imager                  Imager-File-GIF         Imager-File-JPEG        Imager-File-PNG
                Imager-File-TIFF        Imager-Font-FT2         Imager-Font-W32 /,

            # XML
            qw/ XML-LibXML XML-LibXSLT XML-Parser XML-SAX XML-Simple SOAP-Lite /,

            # YAML, JSON & co.
            { module=>'YAML', ignore_testfailure=>1 }, #XXX-TODO: YAML-LibYAML-0.38 test FAILS
            qw/ JSON JSON::XS YAML-Tiny /,

            # dbm related
            qw/ BerkeleyDB DB_File DBM-Deep /,

            # utils
            qw/ pler App-local-lib-Win32Helper /,
            { module=>'pip', ignore_testfailure=>1 }, #XXX-TODO: test fails - The directory 'C:\strawberry\cpan\sources' does not exist

            # par & ppm
            qw/ PAR PAR::Dist::FromPPD PAR::Dist::InstallPPD PAR::Repository::Client/,
            
            # The build path in ppm.xml is derived from $ENV{TMP}. So set TMP to a dedicated location inside of the
            # distribution root to prevent it being locked to the temp directory of the build machine.
            #{ module=>'http://svn.ali.as/cpan/trunk/Perl-Dist-Strawberry/share/modules/PPM-0.01_03.tar.gz', env=>{ TMP=>'<image_dir>\ppm' } }, #XXX-fixme
            
            # tiny
            qw/ Capture-Tiny /,
            
            # misc
            qw/ CPAN::SQLite Alien-Tidyp FCGI Text-Diff /,
            qw/ IO-stringy IO::String String-CRC32 Sub-Uplevel Convert-PEM/,
            qw/ IPC-Run3 IPC-Run IPC-System-Simple /,
            
            # strawberry extras
            qw/ App-module-version /,
        ],
    },
    ### STEP 5 ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::FilesAndDirs',
       commands => [
         # directories
         { do=>'createdir', args=>[ '<image_dir>/cpan' ] },
         { do=>'createdir', args=>[ '<image_dir>/cpan/sources' ] },
         { do=>'createdir', args=>[ '<image_dir>/cpanplus' ] },
         { do=>'createdir', args=>[ '<image_dir>/ppm' ] },
         { do=>'createdir', args=>[ '<image_dir>/win32' ] },
         # templated files
         # XXX-TODO: not tested enough
         { do=>'apply_tt', args=>[ '<dist_sharedir>/config-files/CPAN_Config.pm.tt', '<image_dir>/perl/lib/CPAN/Config.pm', {}, 1 ] }, #XXX-temporary empty tt_vars, no_backup=1
         { do=>'apply_tt', args=>[ '<dist_sharedir>/config-files/CPANPLUS_Config.pm.tt', '<image_dir>/perl/lib/CPANPLUS/Config.pm', {}, 1 ] }, #XXX-temporary empty tt_vars, no_backup=1
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/README.txt.tt', '<image_dir>/README.txt' ] },
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/DISTRIBUTIONS.txt.tt', '<image_dir>/DISTRIBUTIONS.txt' ] },
         # fixed files
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/licenses/License.rtf', '<image_dir>/licenses/License.rtf' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/relocation.pl.bat',    '<image_dir>/relocation.pl.bat' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/update_env.pl.bat',    '<image_dir>/update_env.pl.bat' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/win32/cpan.ico',       '<image_dir>/win32/cpan.ico' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/win32/onion.ico',      '<image_dir>/win32/onion.ico' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/win32/perldoc.ico',    '<image_dir>/win32/perldoc.ico' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/win32/perlhelp.ico',   '<image_dir>/win32/perlhelp.ico' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/win32/strawberry.ico', '<image_dir>/win32/strawberry.ico' ] },
         { do=>'copyfile', args=>[ '<dist_sharedir>/extra-files/win32/win32.ico',      '<image_dir>/win32/win32.ico' ] },
         # URLs
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/win32/CPAN Module Search.url.tt',                  '<image_dir>/win32/CPAN Module Search.url' ] },
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/win32/Learning Perl (tutorials, examples).url.tt', '<image_dir>/win32/Learning Perl (tutorials, examples).url' ] },
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/win32/Live Support (chat).url.tt',                 '<image_dir>/win32/Live Support (chat).url' ] },
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/win32/Perl 5.14 Documentation.url.tt',             '<image_dir>/win32/Perl 5.14 Documentation.url' ] },
         #{ do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/win32/5.14.2.1-64bit Release Notes.url.tt',        '<image_dir>/win32/Strawberry Perl Release Notes.url' ] },
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/win32/Strawberry Perl Release Notes.url.tt',       '<image_dir>/win32/Strawberry Perl Release Notes.url' ] },
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/win32/Strawberry Perl Website.url.tt',             '<image_dir>/win32/Strawberry Perl Website.url' ] },
         { do=>'apply_tt', args=>[ '<dist_sharedir>/extra-files/win32/Win32 Perl Wiki.url.tt',                     '<image_dir>/win32/Win32 Perl Wiki.url' ] },
         # XXX-TODO cleanup (remove unwanted files/dirs)
         { do=>'removefile', args=>[ '<image_dir>/c/bin/gccbug' ] },
         { do=>'removefile_recursive', args=>[ '<image_dir>/perl', '*.dll.AAA' ] },
         #XXX-HACK
         { do=>'copyfile', args=>[ '<image_dir>\c\bin\libmysql__.dll', '<image_dir>\perl\vendor\lib\auto\DBD\mysql\libmysql__.dll' ] }, 
       ],
    },
    ### STEP 6 ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::CreateRelocationFile',
       reloc1_in  => '<dist_sharedir>/relocation/perl1.reloc.txt.initial',
       reloc1_out => '<image_dir>/perl1.reloc.txt',
       reloc2_in  => '<dist_sharedir>/relocation/perl2.reloc.txt.initial',
       reloc2_out => '<image_dir>/perl2.reloc.txt',
    },
    ### STEP 7 ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::OutputZIP', # no options needed
    },
    ### STEP 8 ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::OutputMSM_MSI',
       exclude  => [ # do not include neither to MSM nor to MSI
           #'dirname\subdir1\subdir2',
           #'dirname\file.pm',
           'relocation.pl.bat',
           'update_env.pl.bat',
       ],
       exclude_msm => [ # do not include these to MSM but to MSI
           #qr/^win32\\.*?\.url$/,
           'win32',
           'perl2.reloc.txt',
           'README.txt'
       ],
       msi_upgrade_code    => 'DBA41113-4E91-3FFC-B400-573BB4B80705', #BEWARE: fixed value for all 64bit releases (for ever)
       app_publisher       => 'strawberryperl.com project',
       url_about           => 'http://strawberryperl.com/',
       url_help            => 'http://strawberryperl.com/support.html',
       msi_default_instdir => 'c:\strawberry',
       msi_main_icon       => '<dist_sharedir>\msi\files\strawberry.ico',
       msi_license_rtf     => '<dist_sharedir>\msi\files\License-short.rtf',
       msi_dialog_bmp      => '<dist_sharedir>\msi\files\StrawberryDialog.bmp',
       msi_banner_bmp      => '<dist_sharedir>\msi\files\StrawberryBanner.bmp',
       msi_debug           => 0,

       start_menu => [ # if "description" is missing it will be set to the same value as "name"
         { type=>'shortcut', name=>'Perl (command line)', icon=>'<dist_sharedir>\msi\files\perlexe.ico', description=>'Quick way to get to the command line in order to use Perl', target=>'[SystemFolder]cmd.exe', workingdir=>'PersonalFolder' },
         { type=>'shortcut', name=>'Strawberry Perl Release Notes', icon=>'<dist_sharedir>\msi\files\strawberry.ico', target=>'[d_win32]Strawberry Perl Release Notes.url', workingdir=>'d_win32' },
         { type=>'shortcut', name=>'Strawberry Perl README', target=>'[INSTALLDIR]README.txt', workingdir=>'INSTALLDIR' },
         { type=>'folder',   name=>'Tools', members=>[
              { type=>'shortcut', name=>'CPAN Client', icon=>'<dist_sharedir>\msi\files\cpan.ico', target=>'[d_perl_bin.<MSMID>]cpan.bat', workingdir=>'d_perl_bin.<MSMID>' },
              { type=>'shortcut', name=>'Create local library areas', icon=>'<dist_sharedir>\msi\files\strawberry.ico', target=>'[d_perl_bin.<MSMID>]llw32helper.bat', workingdir=>'d_perl_bin.<MSMID>' },
         ] },
         { type=>'folder', name=>'Related Websites', members=>[
              { type=>'shortcut', name=>'CPAN Module Search', icon=>'<dist_sharedir>\msi\files\cpan.ico', target=>'[d_win32]CPAN Module Search.url', workingdir=>'d_win32' },
              { type=>'shortcut', name=>'Perl 5.14 Documentation', icon=>'<dist_sharedir>\msi\files\perldoc.ico', target=>'[d_win32]Perl 5.14 Documentation.url', workingdir=>'d_win32' },
              { type=>'shortcut', name=>'Win32 Perl Wiki', icon=>'<dist_sharedir>\msi\files\strawberry.ico', target=>'[d_win32]Win32 Perl Wiki.url', workingdir=>'d_win32' },
              { type=>'shortcut', name=>'Strawberry Perl Website', icon=>'<dist_sharedir>\msi\files\strawberry.ico', target=>'[d_win32]Strawberry Perl Website.url', workingdir=>'d_win32' },
              { type=>'shortcut', name=>'Learning Perl (tutorials, examples)', icon=>'<dist_sharedir>\msi\files\perldoc.ico', target=>'[d_win32]Learning Perl (tutorials, examples).url', workingdir=>'d_win32' },
              { type=>'shortcut', name=>'Live Support (chat)', icon=>'<dist_sharedir>\msi\files\onion.ico', target=>'[d_win32]Live Support (chat).url', workingdir=>'d_win32' },
         ] },       
       ],
       env => {
         TERM => "dumb",
         PERL_YAML_BACKEND => "YAML",
         PERL_JSON_BACKEND => "JSON::XS",
       },

    },
    ### STEP 9 ###########################
    {
        plugin => 'Perl::Dist::Strawberry::Step::InstallModules',
        modules => [ 'Portable' ], # modules specific to portable edition
    },
    ### STEP 10 ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::SetupPortablePerl', # no options needed
    },
    ### STEP 11 ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::FilesAndDirs',
       commands => [ # files and dirs specific to portable edition
         { do=>'removefile', args=>[ '<image_dir>/README.txt', '<image_dir>/perl2.reloc.txt', '<image_dir>/perl1.reloc.txt', '<image_dir>/update_env.pl.bat', '<image_dir>/relocation.pl.bat' ] },
         { do=>'createdir',  args=>[ '<image_dir>/data' ] },
         { do=>'copyfile',   args=>[ '<dist_sharedir>/portable/portable.perl.64',    '<image_dir>/portable.perl' ] }, # take portable.perl.32 or portable.perl.64
         { do=>'copyfile',   args=>[ '<dist_sharedir>/portable/portableshell.bat',   '<image_dir>/portableshell.bat' ] },
         { do=>'apply_tt',   args=>[ '<dist_sharedir>/portable/README.portable.txt.tt', '<image_dir>/README.portable.txt' ] },
       ],
    },
    ### STEP 12 ###########################
    {
       plugin => 'Perl::Dist::Strawberry::Step::OutputPortableZIP', # no options needed
    },
  ],
}