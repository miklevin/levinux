cd ../../../../Pipulate.app/Contents/MacOS/
mv ./home.qcow ../../../Reset/home-backup.qcow
rm ./opt.qcow
rm ./tce.qcow
rm *conflicted*
rm ../../../Reset/*ErrorLog*
cp ./home-fresh.qcow ./home.qcow
cp ./opt-fresh.qcow ./opt.qcow
cp ./tce-fresh.qcow ./tce.qcow

