# DynamoDB

```css
DynamoDB is a non-relational database. 
It is a fully managed service created by AWS. 
With DynamoDB I create tables, but unlike a relational database, each table is completely independent.

DynamoDB is not like the server-based services that AWS offers (RDS, ElastiCache, etc.), 
it is "serverless" in the sense that I do not have any control over the physical infrastructure that it runs on. 
I do not pay for the service when I'm not using it (except used storage space). 
Because DynamoDB is different than server-based offerings, the mechanisms for redundancy are also different. 
DynamoDB offers multi-region, active/active service if I elect it. 
This is called DyanmoDB Global Tables.
```

## Task:
Create a DynamoDB table and extend it as a Global table into a second region.

## Solution:

### Setting up a DynamoDB Table
1. Navigate to the DynamoDB service and click on the **Create table** button.
2. Provide the Table details as:
   1. Table name: *dynamodb-table-lab03* 
   2. Partition key: *partition-key-dynamodb-table-lab03*
      - A partition key will be used to allocate data across hosts for scalability and availability.
   3. Sort key: *sort-key-dynamodb-table-lab03*
3. Leave the Table settings as default, and finish creating the Table. 
   - I can change some of these settings after creating the table, if needed.

### Configuring the table to be a Global table

1. Once the Table is ready, view the Table details. 
   1. Navigate to the **Global tables** tab and click on the **Create replica** button.
2. Choose any one of the available replication regions and create a replica. 
3. I now have a table that can be read from and written to in multiple regions. 
   - Up next, let's create items in the table in one of the 3 regions, 
   - then switch to the other region and observe that I can see the item there as well.
4. I can either use **Create item** from the Table **Actions** dropdown, or use **Explore table** items button to view/create items. 
   - After creating several items, switch to the other region and observe that I can see those items there as well.




