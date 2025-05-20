from rdkit import Chem
from rdkit.Chem import Descriptors
from rdkit.ML.Descriptors import MoleculeDescriptors

import pandas as pd
import numpy as np

# Set file direction
file_path = './00.smiles_filtered.csv'

# Load CSV file
df = pd.read_csv(file_path)

# SMILES 
smiles_list = df['Canonical SMILES']

# Convert smiles to mol format
mols = [Chem.MolFromSmiles(smiles) for smiles in smiles_list]

# Function definition: Physicochemical molecular descriptors about 120
def RDkit_descriptors(mols):
    calc = MoleculeDescriptors.MolecularDescriptorCalculator([x[0] for x in Descriptors._descList])
    desc_names = calc.GetDescriptorNames()
    
    Mol_descriptors =[]
    for mol in mols:
        # add hydrogens to molecules
        mol=Chem.AddHs(mol)
        # Calculate all 200 descriptors for each molecule
        descriptors = calc.CalcDescriptors(mol)
        Mol_descriptors.append(descriptors)
    return Mol_descriptors,desc_names 

# Calculate Physicochemical molecular descriptors
Mol_descriptors,desc_names = RDkit_descriptors(mols)

# Construct dataframe
df_with_200_descriptors = pd.DataFrame(Mol_descriptors,columns=desc_names)

# Set CSV file direction
output_csv_path = 'rdkit_200_descriptors.csv'

# Save DataFrame to CSV file
df_with_200_descriptors.to_csv(output_csv_path, index=False)

print(f"Physicochemical molecular descriptors: {output_csv_path}")

