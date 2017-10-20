import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';

import 'rxjs/add/operator/toPromise';

import { Form } from '../model/form';
import { Agency } from '../model/agency';

const AGENCIES: Agency[] = [
  { name: 'PAG-IBIG', subgroup: 'Housing Related Forms', subgroupEncoded: encodeURI('Housing Related Forms') },
  { name: 'PAG-IBIG', subgroup: 'Provident Related Forms', subgroupEncoded: encodeURI('Provident Related Forms') },
  { name: 'PAG-IBIG', subgroup: 'Other Forms', subgroupEncoded: encodeURI('Other Forms') }
];

@Injectable()
export class FormsService {

  constructor(private http: Http) {}

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
    return this.http.get('/rest/doc')
             .toPromise()
             .then(response => response.json() as Form[])
             .catch(this.handleError);
  }

  private handleError(error: any): Promise<any> {
    console.error('An error occurred', error); // for demo purposes only
    return Promise.reject(error.message || error);
  }
}
