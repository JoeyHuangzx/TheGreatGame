using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameSceneManager
{

    public static void LoadScene(string _sceneName)
    {
        SceneManager.LoadSceneAsync(_sceneName);
        APP.GetInstance().StartCoroutine(LoadAsyncScene(_sceneName));
    }

    static IEnumerator LoadAsyncScene(string _sceneName)
    {
        // The Application loads the Scene in the background as the current Scene runs.
        // This is particularly good for creating loading screens.
        // You could also load the Scene by using sceneBuildIndex. In this case Scene2 has
        // a sceneBuildIndex of 1 as shown in Build Settings.

        AsyncOperation asyncLoad = SceneManager.LoadSceneAsync(_sceneName);

        // Wait until the asynchronous scene fully loads
        while (!asyncLoad.isDone)
        {
           // Debug.Log(string.Format("loading scene per:{0}...",asyncLoad.progress));
            yield return null;
        }
    }

}
