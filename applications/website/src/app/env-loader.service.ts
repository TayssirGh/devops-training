import {Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class EnvLoaderService {

  private backendUrl: string = "";

  constructor(private http: HttpClient) {
  }

  getBackendUrl(): string {
    console.log(this.backendUrl);
    return "http://localhost:3000/access";
  }

  public getJSON(): Observable<any> {
    return this.http.get<any>(`assets/configs/app-config.json`);
  }

  init(): Promise<void> {
    return new Promise(resolve => {
      this.http.get<any>(`assets/configs/app-config.json`).toPromise().then(data => {
        this.backendUrl = data.backendUrl
        resolve();
      })
    });
  }
}
