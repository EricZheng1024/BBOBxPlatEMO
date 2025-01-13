### Using the BBOB Test Suite on PlatEMO v3.x

To use the BBOB test suite, place the folder in the following path:

```
PlatEMO\Problems\Multi-objective optimization
```

This implementation adopts the **`bbob-biobj`** test suite. The **`bbob-biobj`** suite consists of 55 test problems, each characterized by 15 different parameter configurations and 6 alternative numbers of variables (i.e., 2, 3, 5, 10, 20, and 40).

---

### How to Build the BBOB Test Suite for MATLAB from Scratch

Follow these steps:

1. **Download COCO v2.6.3 ([GitHub repository](https://github.com/numbbo/coco/tree/v2.6.3))**

2. **Configure COCO**
   Follow the instructions in the README file provided on the homepage of COCO v2.6.3 GitHub repository.
   - **Compiler Setup**: For example, use MinGW for compilation. Ensure that the system environment variables are properly configured; otherwise, MATLAB will not recognize the compiler.
   - **MATLAB Compiler Check**: Verify that MATLAB is configured with a C language compiler by running the following command in MATLAB:  
     ```matlab
     mex -setup
     ```  
     If issues arise, refer to relevant tutorials for guidance.

3. **No Need to Install `cocopp`**

4. **Set Up a Python Environment**  
   - Create a virtual environment using Conda (Python v3.6).  
   - Run the following command:  
     ```bash
     python do.py run-matlab
     ```  
     This command will automatically start MATLAB and close it twice.  
     **Note**: Any Python interpreter compatible with the version should work, as no additional Python packages or dependencies are required to execute `do.py`.

5. **Extract the Required Folder**  
   After completing the configuration, locate the following folder:  
   ```
   ..\coco-2.6.3\code-experiments\build\matlab
   ```  
   This folder contains all the necessary files. You can rename it if needed.

---

Additional References:
- tpb ([GitHub repository](https://github.com/ryojitanabe/tpb))
