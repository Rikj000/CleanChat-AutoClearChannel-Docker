# Deriving the latest .NET Core 3.1 base image
FROM mcr.microsoft.com/dotnet/runtime:3.1

# Opt-out from the .NET diagnostic pipeline
ENV DOTNET_EnableDiagnostics=0

# Label the authors
LABEL Maintainer="AlexanderNorup & Rikj000"

# Prepare environment (Create folder, update system, install unzip & clean the system)
RUN mkdir /clean-chat-acc && apt-get update && apt-get -y install unzip && apt-get clean

# Set the app working directory
WORKDIR /clean-chat-acc

# Download the latest CleanChat-ACC and add her into the container
ADD https://drive.alexandernorup.com/CleanChat/latest.zip ./

# Extract CleanChat-ACC and remove the remaining .zip
RUN unzip latest.zip && rm latest.zip

# Copy the local config.json file from the working directory into the container
COPY ./config.json ./

# Run the CleanChat AutoClearChannel Bot!
ENTRYPOINT ["dotnet", "CleanChat-AutoClearChannel.dll"]