

# array of all the modules

modules=("alertmanager" "grafana" "prometheus")


# echo blue
echo_blue() {
  echo "\033[34m$1\033[0m" 
}

# echo in green
echo_green() {
  echo_blue "------------------------------------"
  echo "\033[32m$1\033[0m" 
  echo_blue "------------------------------------"  
}



for module in "${modules[@]}"
do
    echo_green "Initializing $module module"
  cd modules/$module
  terraform init
  cd ../../
done
echo_green "All modules initialized successfully"

