namespace :setup do
  desc 'Check to see if ImageMagick is insalled on the server'
  task :imagemagick do
    buffer = <<-IMAGEMAGICKCHECK
      if ! rpm -qa | grep ImageMagick > /dev/null
      then
        echo
        echo
        echo -e '\e[31m\e[1m!!!!!!!! ERROR - ImageMagick Not Installed. Please install and try again... !!!!!!!!\e[0m\e[39m'
        echo 'Try executing `yum install ImageMagick` on the server'
        echo
        echo
        exit 1
      else
        echo 'SUCCESS - ImageMagick is Installed on the server. Continuing.'
      fi
    IMAGEMAGICKCHECK

    on roles(:app) do
      filename = capture("mktemp /tmp/imagemagickcheckXXX.sh")
      upload! StringIO.new(buffer), filename
      execute "chmod -x #{filename}"
      execute "sh #{filename}"
    end
  end
end