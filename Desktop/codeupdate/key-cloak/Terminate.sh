#!/bin/bash
echo "!!!!!!!!!!!!!!!!!!Soft remove !!!!!!!!!!!!!!!!!!!!!!!!"

docker-compose down 

echo " 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 Forcefully remove  🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁"

find / -name "docker-compose.yml" 2>/dev/null | while read -r compose_file; do
  project_dir=$(dirname "$compose_file")
  echo "Bringing down Docker Compose project in $project_dir..."
  (cd "$project_dir" && docker-compose down || echo "Failed to bring down project in $project_dir")
done

echo "Forcefully stopping all remaining Docker Compose services..."

docker ps -q --filter "label=com.docker.compose.project" | while read -r container_id; do
  echo "Stopping container $container_id..."
  docker stop "$container_id" || echo "Failed to stop container $container_id"
done

echo "Removing all Docker Compose containers..."
docker ps -aq --filter "label=com.docker.compose.project" | while read -r container_id; do
  echo "Removing container $container_id..."
  docker rm -f "$container_id" || echo "Failed to remove container $container_id"
done

echo "Removing all Docker Compose networks..."
docker network ls --filter "label=com.docker.compose.project" -q | while read -r network_id; do
  echo "Removing network $network_id..."
  docker network rm "$network_id" || echo "Failed to remove network $network_id"
done
# Final message
echo "All Docker Compose projects and resources have been cleaned up."



echo " 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 see you soon DEVX  🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁 🙁"



########################
#MTN by : rajneeshMahala
########################