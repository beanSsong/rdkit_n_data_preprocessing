#This code is modified from the code by Copyright (c) 2023 Gashaw M. Goshu

from rdkit import Chem
from rdkit.Chem import AllChem

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

fpgen = AllChem.GetAtomPairGenerator()

fingerprint_data = []

for mol in mols:
    fps = fpgen.GetFingerprint(mol)
    bit_vector = list(fps.ToBitString())
    fp_list = [int(bit) for bit in bit_vector]
    fingerprint_data.append(fp_list)

columns = [f'Bit_{i}' for i in range(2048)]
fingerprint_df = pd.DataFrame(fingerprint_data, columns=columns)

# Set CSV file direction
output_csv_path = 'rdkit_fingerprint.csv'

fingerprint_df.to_csv(output_csv_path, index=False)

print(f“Molecular fingerprinter: {output_csv_path}")

