#!/bin/bash
  echo "NadekoBot 1.0 Download"
  echo "Mirai was here."
  if git --version 2>&1 >/dev/null; 
  then echo "Git Installed." 
  else echo "Git is not installed. Please install Git." | exit 1
  if dotnet --version 2>&1 >/dev/null; 
  then echo "Dotnet installed." 
  else echo "Dotnet is not installed. Please install dotnet." | exit 1
  mkdir NadekoBot-temp
  echo "Created NadekoBot-temp folder"
  cd NadekoBot-temp
  echo "Downloading NadekoBot, please wait."
  git clone -b 1.0 --recursive -v https://github.com/Kwoth/NadekoBot.git
  echo "NadekoBot downloaded."
  echo "Building NadekoBot"
  cd NadekoBot/discord.net/src/Discord.Net
  dotnet restore && dotnet build --configuration Release
  cd ../Discord.Net.Commands/ && dotnet restore && dotnet build --configuration Release
  cd ../../../src/NadekoBot/ && dotnet restore && dotnet build --configuration Release
  sudo cp ./bin/Release/netcoreapp1.0/libs/* ./bin/Release/netcoreapp1.0/
  echo "Setting up NadekoBot"
  dotnet run --configuration Release
exit 0
