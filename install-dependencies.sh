#!/bin/bash

echo "=== DEPENDENCIES INSTALLATION FOR THE FOLLOWING APPS ===";
echo "===> - APPS/NEXT-FRONTEND";
printf "===> - APPS/APOLLO-GRAPHQL \n\n";

# printf "Running cd /workspaces/OpenXDR..." && cd /workspaces/OpenXDR > /dev/null 2>&1 && printf "Done" || echo "An error occurred during yarn install."

echo " ( (";
echo "  ) )";
echo "........"; 
echo "|      |]  It will take some time. Rest and enjoy coffee";
echo "\      /";
echo " \`----'";
printf "\n";

echo "===> 1. CHANGE DIR TO PROJECT";
printf "===> RUNNING: cd /workspaces/OpenXDR --- " && cd /workspaces/OpenXDR && printf "Done\n" || printf "Error\n";

echo "===> 2. INSTALL APPS/NEXT-FRONTEND DEPENDENCIES";
echo "===> 2.1 REMOVE NODE_MODULES FOR CLEAN INSTALL";
printf "===> RUNNING: Removing node_modules  --- ";
if [ -d "node_modules" ]; then
  rm -rf node_modules && printf "Done\n" || printf "Error\n"
else
  printf "Skip (No node_modules)\n";
fi

echo "===> 2.1 INSTALLING USING PNPM";
printf "===> RUNNING: pnpm install --store-dir node_modules/.pnpm-store --- ";
pnpm install --store-dir node_modules/.pnpm-store > /dev/null 2>&1 && printf "Done\n" || printf "Error\n";

echo "===> 2.2 RUN APPS/NEXT-FRONTEND";
echo "cd apps/next-frontend && nx dev";

echo "===> 3. INSTALL APPS/APOLLO-GRAPHQL DEPENDENCIES";
echo "===> 3.1 CHANGE DIR TO APPS/APOLLO-GRAPHQL";
printf "===> RUNNING: cd /workspaces/OpenXDR/apps/apollo-graphql --- "
cd /workspaces/OpenXDR/apps/apollo-graphql && printf "Done\n" || printf "Error\n";

echo "===> 3.2 REMOVE NODE_MODULES FOR CLEAN INSTALL";
printf "===> RUNNING: Removing node_modules  --- ";
if [ -d "node_modules" ]; then
  rm -rf node_modules && printf "Done\n" || printf "Error\n"
else
  printf "Skip (No node_modules)\n";
fi

echo "===> 3.3 INSTALL REQUIRED DEPENDENCIES";
printf "===> RUNNING: yarn install --- ";
yarn install > /dev/null 2>&1 && printf "Done\n" || printf "Error\n";

echo "===> 3.4 INSTALL PYTHON DEPENDENCIES";
printf "===> RUNNING: yarn install:python --- ";
yarn install:python > /dev/null 2>&1 && printf "Done\n" || printf "Error\n";

echo "===> 3.5 SUGGESTION TO RUN";
echo "cd apps/apollo-graphql && yarn start";

echo "   _.._..,_,_ ";
echo "  (          )";
echo "   ]~,\"-.-~~[";
echo " .=])' (;  ([ ";
echo " | ]:: '    [  DONE. CHEER! ";
echo " '=]): .)  ([ ";
echo "   |:: '    | ";
echo "    ~~----~~  ";