# diagram.py
from diagrams import Cluster,Diagram
from diagrams.azure.compute import AKS, ACR
from diagrams.onprem.network import Nginx
from diagrams.azure.network import LoadBalancers, TrafficManagerProfiles
from diagrams.k8s.compute import Pod
from diagrams.azure.database import ManagedDatabases

with Diagram("Kubernetes Multi Cluster Architecture", show=False, direction="TB"):

    GTM = TrafficManagerProfiles("DNS Load Balancer")

    with Cluster("West Region spoke"):
        WEST_WTLB_A = Nginx("WTLB WEST")

        with Cluster("K8s Cluster A"):
            WEST_APPLB_A = LoadBalancers("Ingress A")
            svcgrpA = [Pod("svcA"),
                        Pod("svcB")]
            


        with Cluster("K8s Cluster B"):
            WEST_APPLB_B = LoadBalancers("Ingress B")
            svcgrpB = [Pod("svcA"),
                        Pod("svcB")]

        WEST_WTLB_A - WEST_APPLB_A
        WEST_WTLB_A - WEST_APPLB_B
        WEST_APPLB_A >> svcgrpA
        WEST_APPLB_B >> svcgrpB



    with Cluster("EAST Region spoke"):
        EAST_WTLB_A = Nginx("WTLB EAST")
        with Cluster("K8s Cluster A"):
            EAST_APPLB_A = LoadBalancers("Ingress A")
            EAST_SVC_D = Pod("svcD")

        EAST_WTLB_A - EAST_APPLB_A
        EAST_APPLB_A >> EAST_SVC_D

    with Cluster("Shared Resources"):
        DB = ManagedDatabases("Data Store")
        ACR = ACR("Image Repo")

    GTM >> WEST_WTLB_A
    GTM >> EAST_WTLB_A
    svcgrpB - DB
    svcgrpA - ACR
    svcgrpB >> EAST_SVC_D