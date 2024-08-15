// @ts-ignore
import {Injectable} from '@angular/core';
// @ts-ignore
import {HttpClient} from "@angular/common/http";
// @ts-ignore
import {Observable} from "rxjs";

// @ts-ignore
@Injectable({
  providedIn: 'root'
})
export class EnvLoaderService {

  private backendUrl: string = "";

  constructor(private http: HttpClient) {
  }

  getBackendUrl(): string {
    return this.backendUrl;
  }

  public getJSON(): Observable<any> {
    return this.http.get<any>(`assets/configs/app-config.json`);
  }

  init(): Promise<void> {
    return new Promise(resolve => {
      // @ts-ignore
      this.http.get<any>(`assets/configs/app-config.json`).toPromise().then(data => {
        this.backendUrl = data.backendUrl
        resolve();
      })
    });
  }
}
