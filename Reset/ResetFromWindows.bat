cd ..\Levinux.app\Contents\MacOS\
move home.qcow ..\..\..\Reset\home-backup.qcow
del opt.qcow
del tce.qcow
del *conflicted*
del ..\..\..\Reset\*ErrorLog*
copy home-fresh.qcow home.qcow
copy opt-fresh.qcow opt.qcow
copy tce-fresh.qcow tce.qcow
del stderr.txt
del stdout.txt
