# Seattle University File System
 <a href="https://github.com/rpanu/SUFS" target="_blank">https://github.com/rpanu/SUFS</a>


## What is this?
The Seattle University File System is a distributed file system that is built with NodeJS and is hosted on AWS.

## How does it work?
The client pulls a file from S3 and breaks it down into blocks. Each block is assigned a blockID and has three copies stored across multiple DataNodes. The list of blockIDs that correspond to a single file, is stored in the NameNode. At any point the user can request a specific file and it can be pulled from the DataNodes, block by block, where it will be reassembled in the client. 

## What if something goes wrong?
Since SUFS is akin to a Hadoop Distributed File System, it also has a similar fault-tolerance system. To ensure that none of the DataNodes have failed, each DataNode sends the NameNode a blockReport which contains information about the blocks it contains. The NameNode has a timer in place that resets every time a blockReport is received. If a DataNode fails, that timer runs out and the NameNode is aware of exactly which node has failed. Since there are multiple block copies distributed across the DataNodes, the NameNode uses the failed node's last blockReport to replicate all the blocks that were lost.
