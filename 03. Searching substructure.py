from rdkit import Chem
from rdkit.Chem.Draw import rdMolDraw2D

smi = “c1cc(F)ccc1Cl”
mol = Chem.MolFromSmiles(smi)

patt = Chem.MolFromSmarts(“ClccccF”)

hit_ats = list(mol.GetSubstructMatch(patt))

hit_bonds = []
for bond in patt.GetBonds():
   aid1 = hit_ats[bond.GetBeginAtomIdx()]
   aid2 = hit_ats[bond.GetEndAtomIdx()]
   hit_bonds.append(mol.GetBondBetweenAtoms(aid1,aid2).GetIdx())

d = rdMolDraw2D.MolDraw2DCairo(500, 500)

img = rdMolDraw2D.PrepareAndDrawMolecule(d, mol, highlightAtoms=hit_ats, highlightBonds=hit_bonds)
d.FinishDrawing()

d.WriteDrawingText(“./sub_structure.png”)
