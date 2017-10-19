import { Injectable } from '@angular/core';
import { Form } from '../model/form';
import { Agency } from '../model/agency';

const AGENCIES: Agency[] = [
  { name: 'PAG-IBIG', subgroup: 'Housing Related Forms', subgroupEncoded: encodeURI('Housing Related Forms') },
  { name: 'PAG-IBIG', subgroup: 'Provident Related Forms', subgroupEncoded: encodeURI('Provident Related Forms') },
  { name: 'PAG-IBIG', subgroup: 'Other Forms', subgroupEncoded: encodeURI('Other Forms') }
];

const FORMS : Form[] = [
	{
    "agency": "PAG-IBIG",
    "classification": ["Housing Related Forms", "Housing Loan Availment"],
    "description": "Checklist of Requirements for Pag-IBIG Housing Loan (For Window 1 Accounts)",
    "documentNumber": "HQP-HLF-065",
    "downloadableLink": "DLForms/housingrelated/HLF065_ChecklistOfRequirements_Window1_V04.pdf",
    "fillableLink": "",
    "version": "V04"
  },
  {
    "agency": "PAG-IBIG",
    "classification": ["Housing Related Forms", "Housing Loan Availment"],
    "description": "Checklist of  Requirements for Pag-IBIG Housing Loan (For Window 2 Accounts)",
    "documentNumber": "HQP-HLF-066",
    "downloadableLink": "DLForms/housingrelated/HLF066_ChecklistOfRequirements_HL_Window2_V03.pdf",
    "fillableLink": "",
    "version": "V03"
  },
  {
    "agency": "PAG-IBIG",
    "classification": ["Housing Related Forms", "Housing Loan Availment"],
    "description": " Checklist of  Requirements For Pag-IBIG Housing Loan Under Retail Accounts (Construction of  House/Home Improvement)",
    "documentNumber": "HQP-HLF-368",
    "downloadableLink": "DLForms/housingrelated/HLF368_ChecklistOfRequirementsForPag-IBIGHousingLoanUnderRetailAccounts_....pdf",
    "fillableLink": "",
    "version": "V01"
  }
];

@Injectable()
export class FormsService {

  constructor() {}

  getAgencies() : Promise<Agency[]> {
    return Promise.resolve(AGENCIES);
  }

  getAgency(name: string, subgroup: string) : Promise<Agency> {
    for (let agency of AGENCIES) {
      if (agency.name === name && agency.subgroup === subgroup) {
        return Promise.resolve(agency);
      }
    }
    return Promise.resolve(null);
  }

  getForms() : Promise<Form[]> {
    return Promise.resolve(FORMS);
  }
}
