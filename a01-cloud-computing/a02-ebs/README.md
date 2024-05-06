# Elastic Block Store (EBS)

- EBS is a storage solution for EC2 instances and is a physical hard drive that is attached to the EC2 instance to increase storage.
- EBS is found on the EC2 Dashboard.
- There are several EBS volume types that fall under the categories of Solid State Drives (**SSD**) and Hard Disk Drives (**HDD**).
- Create EBS Volume:
  - AWS allows us to create a volume from either of the following three methods:
    - **Option 1** - Create and attach EBS volumes while creating an EC2 instance using the Launch Instance wizard.
    - **Option 2** - Create an empty EBS volume, and later you can attach it to a running instance.
    - **Option 3** - Create an EBS volume from a previously created snapshot, and later you can attach it to a running instance.

## Let's do Option 2 and see the set-up wizard create an empty EBS volume.

### Step 1. Get Started
- To get started, **go to the EC2 Dashboard**, and
- select the Elastic Block Store → Volumes service in the left navigation panel.
- Select the Create Volume button

### Step 2. Volume Specifications
- I will be taken to a set-up wizard to create a volume. 
- I will have to configure the volume settings.

I will have to specify the following details:

1. Volume type:
   - AWS offers various types of volumes.
   - I will use **General Purpose SSD (gp2)**
2. Size (GB):
   - The size should be with-in the limits of the Volume type I have chosen above.
   - The **minimum will be 1 GB** and **Max will be 16384**.
3. Availability Zone:
   - I can likely use the default value, 
   - or I can choose your preferred AZ.
   - The value will be based on the region I'm in.
4. Snapshot ID:
   - Specify the ID of the snapshot if I wish to create a volume from an existing snapshot. 
   - Remember, a snapshot is the saved state of another volume at a particular moment.
5. Tag:
   - Specify the key-value pair
   - such as **{Name: Grace_Demo_Volume}**

**Volume Type**	                    **Min (GB)**	    **Max (GB)**	    **I/O per sec**
General Purpose SSD (gp2)	            1	            16384	            [100 - 3000] IOPS
General Purpose SSD (gp3)	            1	            16384	            [3000-16000] IOPS
Provisioned IOPS SSD (io1) and (io2)	4	            16384	            [100-64000] IOPS
Cold HDD (sc1)	                        500	            16384	            Not applicable
Throughput Optimized HDD (st1)	        500	            16384	            Not applicable
Magnetic (standard)	                    1	            1024	            100 IOPS (avg)

