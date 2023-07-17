for secret_file in $(ls *secret.yml); do
  kubeseal < "${secret_file}" > "${secret_file/.yml/.sealed.yml}"
done

#rm *secret.yml
#cd ..
#git add .
#git commit -m "Seal secrets"
#git push 